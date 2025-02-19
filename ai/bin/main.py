from transformers import pipeline

fill_mask = pipeline("fill-mask", model="bert-base-uncased")
print(fill_mask("Machine learning is a [MASK] field.", top_k=3))

