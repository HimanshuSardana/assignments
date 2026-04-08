import flask
import pandas as pd
import numpy as np
import io
from flask_mail import Mail, Message
from flask_cors import CORS
import os

app = flask.Flask(__name__)
CORS(app)


app.config["MAIL_SERVER"] = "smtp.gmail.com"
app.config["MAIL_PORT"] = 465
app.config["MAIL_USE_SSL"] = True
app.config["MAIL_USERNAME"] = os.getenv("MAIL_USERNAME", "")
app.config["MAIL_PASSWORD"] = os.getenv("MAIL_PASSWORD", "")
app.config["MAIL_DEFAULT_SENDER"] = ("Himanshu Sardana", "hsardana_be23@thapar.edu")

mail = Mail(app)


def topsis_analysis(df, weights, impacts):
    data = df.iloc[:, 1:].values.astype(float)

    norm = np.sqrt((data**2).sum(axis=0))
    norm_data = data / norm

    weighted = norm_data * weights

    ideal_best = np.where(
        np.array(impacts) == "+", weighted.max(axis=0), weighted.min(axis=0)
    )
    ideal_worst = np.where(
        np.array(impacts) == "+", weighted.min(axis=0), weighted.max(axis=0)
    )

    d_pos = np.sqrt(((weighted - ideal_best) ** 2).sum(axis=1))
    d_neg = np.sqrt(((weighted - ideal_worst) ** 2).sum(axis=1))

    return d_neg / (d_pos + d_neg)


@app.route("/upload", methods=["POST"])
def upload_file():
    email_recipient = flask.request.form.get("email")
    weights_raw = flask.request.form.get("weights")
    impacts_raw = flask.request.form.get("impacts")
    file = flask.request.files.get("file")

    if not all([weights_raw, impacts_raw, file]):
        return "Missing required fields (file, weights, or impacts)", 400

    try:
        weights = np.array([float(w) for w in weights_raw.split(",")])
        impacts = impacts_raw.split(",")

        if file.filename.endswith(".csv"):
            df = pd.read_csv(file)
        else:
            df = pd.read_excel(file)

        scores = topsis_analysis(df, weights, impacts)
        df["Topsis Score"] = scores
        df["Rank"] = df["Topsis Score"].rank(ascending=False).astype(int)

        if email_recipient:
            try:
                msg = Message("TOPSIS Analysis Results", recipients=[email_recipient])
                msg.body = "Hi,\n\nPlease find your TOPSIS ranking results attached as a CSV file.\n\nBest regards,\nHimanshu Sardana"

                # Create CSV attachment in memory
                buffer = io.StringIO()
                df.to_csv(buffer, index=False)
                msg.attach("results.csv", "text/csv", buffer.getvalue())

                mail.send(msg)
            except Exception as e:
                print(f"Mail failed to send: {e}")

        return df.to_json(orient="records"), 200

    except Exception as e:
        return f"Error: {str(e)}", 500


if __name__ == "__main__":
    app.run(debug=True)
