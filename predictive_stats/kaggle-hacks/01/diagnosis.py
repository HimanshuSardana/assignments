import pandas as pd
import numpy as np
import torch
import torch.nn as nn
import torch.optim as optim

from torch.utils.data import DataLoader, TensorDataset
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.feature_selection import SelectKBest, mutual_info_classif

import joblib
import warnings

warnings.filterwarnings("ignore")

torch.manual_seed(42)
np.random.seed(42)

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
print("Using device:", device)

train_df = pd.read_csv("train.csv")
test_df = pd.read_csv("test.csv")

X = train_df.drop(columns=["id", "target"])
y = train_df["target"].astype(int)

X_test = test_df.drop(columns=["id"])

# Remove duplicate columns (very common in your dataset)
X = X.loc[:, ~X.T.duplicated()]
X_test = X_test[X.columns]

num_classes = y.nunique()
print("Classes:", num_classes)
print("Features:", X.shape[1])

X_train, X_val, y_train, y_val = train_test_split(
    X, y, test_size=0.2, stratify=y, random_state=42
)

K = 40  # try 30–50 later

selector = SelectKBest(mutual_info_classif, k=K)

X_train_fs = selector.fit_transform(X_train, y_train)
X_val_fs = selector.transform(X_val)
X_test_fs = selector.transform(X_test)

print("Selected features:", X_train_fs.shape[1])

scaler = StandardScaler()

X_train_sc = scaler.fit_transform(X_train_fs)
X_val_sc = scaler.transform(X_val_fs)
X_test_sc = scaler.transform(X_test_fs)

batch_size = 128

train_loader = DataLoader(
    TensorDataset(
        torch.tensor(X_train_sc, dtype=torch.float32),
        torch.tensor(y_train.values, dtype=torch.long),
    ),
    batch_size=batch_size,
    shuffle=True,
)

val_loader = DataLoader(
    TensorDataset(
        torch.tensor(X_val_sc, dtype=torch.float32),
        torch.tensor(y_val.values, dtype=torch.long),
    ),
    batch_size=batch_size,
    shuffle=False,
)

test_tensor = torch.tensor(X_test_sc, dtype=torch.float32)


class FeatureTokenizer(nn.Module):
    def __init__(self, n_features, d_token):
        super().__init__()
        self.weight = nn.Parameter(torch.randn(n_features, d_token))
        self.bias = nn.Parameter(torch.zeros(n_features, d_token))

    def forward(self, x):
        return x.unsqueeze(-1) * self.weight + self.bias


class TransformerBlock(nn.Module):
    def __init__(self, d_token, n_heads, dropout):
        super().__init__()
        self.attn = nn.MultiheadAttention(
            d_token, n_heads, dropout=dropout, batch_first=True
        )
        self.ff = nn.Sequential(
            nn.Linear(d_token, d_token * 4), nn.ReLU(), nn.Linear(d_token * 4, d_token)
        )
        self.ln1 = nn.LayerNorm(d_token)
        self.ln2 = nn.LayerNorm(d_token)
        self.dropout = nn.Dropout(dropout)

    def forward(self, x):
        attn_out, _ = self.attn(x, x, x)
        x = self.ln1(x + self.dropout(attn_out))
        ff_out = self.ff(x)
        x = self.ln2(x + self.dropout(ff_out))
        return x


class FTTransformer(nn.Module):
    def __init__(
        self, n_features, n_classes, d_token=64, n_heads=8, n_layers=4, dropout=0.1
    ):
        super().__init__()
        self.tokenizer = FeatureTokenizer(n_features, d_token)

        self.blocks = nn.Sequential(*[
            TransformerBlock(d_token, n_heads, dropout) for _ in range(n_layers)
        ])

        self.head = nn.Sequential(
            nn.Linear(n_features * d_token, 256), nn.ReLU(), nn.Linear(256, n_classes)
        )

    def forward(self, x):
        x = self.tokenizer(x)
        x = self.blocks(x)
        x = x.flatten(1)
        return self.head(x)


def train_epoch(model, loader):
    model.train()
    total_loss, correct, total = 0, 0, 0

    for x, y in loader:
        x, y = x.to(device), y.to(device)

        optimizer.zero_grad()
        logits = model(x)
        loss = criterion(logits, y)

        loss.backward()
        torch.nn.utils.clip_grad_norm_(model.parameters(), 1.0)
        optimizer.step()

        total_loss += loss.item()
        correct += (logits.argmax(1) == y).sum().item()
        total += y.size(0)

    return total_loss / len(loader), 100 * correct / total


@torch.no_grad()
def eval_epoch(model, loader):
    model.eval()
    correct, total = 0, 0

    for x, y in loader:
        x, y = x.to(device), y.to(device)
        logits = model(x)
        correct += (logits.argmax(1) == y).sum().item()
        total += y.size(0)

    return 100 * correct / total


model = FTTransformer(n_features=X_train_sc.shape[1], n_classes=num_classes).to(device)

criterion = nn.CrossEntropyLoss()

optimizer = optim.AdamW(model.parameters(), lr=3e-4, weight_decay=1e-4)

scheduler = optim.lr_scheduler.CosineAnnealingLR(optimizer, T_max=200)

best_val = 0
patience = 30
wait = 0

for epoch in range(300):
    train_loss, train_acc = train_epoch(model, train_loader)
    val_acc = eval_epoch(model, val_loader)
    scheduler.step()

    if val_acc > best_val:
        best_val = val_acc
        wait = 0
        torch.save(model.state_dict(), "best_ft_transformer.pth")
    else:
        wait += 1

    if (epoch + 1) % 10 == 0:
        print(
            f"Epoch {epoch + 1:03d} | "
            f"Train Acc: {train_acc:.2f}% | "
            f"Val Acc: {val_acc:.2f}%"
        )

    if wait >= patience:
        print("Early stopping")
        break

print("Best Validation Accuracy:", best_val)

model.load_state_dict(torch.load("best_ft_transformer.pth"))
model.eval()

with torch.no_grad():
    test_logits = model(test_tensor.to(device))
    test_preds = test_logits.argmax(1).cpu().numpy()

submission = pd.DataFrame({"id": test_df["id"], "target": test_preds})

submission.to_csv("submission_ft_transformer.csv", index=False)
print("Saved submission_ft_transformer.csv")

joblib.dump(selector, "feature_selector.pkl")
joblib.dump(scaler, "scaler.pkl")

print("Model + scaler + selector saved")
