FROM cgr.dev/chainguard/python:latest-dev@sha256:678b051d9daf61ab6c1eaad7f7eb7426e612a99b655b715a639a6f898318a6e7 as builder

WORKDIR /giropops-senhas

COPY src/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt --user

FROM cgr.dev/chainguard/python:latest@sha256:d0a0ef8759e4da134c9848b9bba9aa9b7fec345427f093f1a37ca02434e685d8

WORKDIR /giropops-senhas

COPY --from=builder /home/nonroot/.local/lib/python3.12/site-packages /home/nonroot/.local/lib/python3.12/site-packages

COPY src/app.py src/tailwind.config.js ./
COPY src/static ./static
COPY src/templates ./templates

ENTRYPOINT [ "python", "-m" , "flask", "run", "--host=0.0.0.0" ]
