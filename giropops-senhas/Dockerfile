FROM cgr.dev/chainguard/python:latest-dev@sha256:1aad742e9c8ea5597520fe43ae154e0160fb8364485506945f7de6cd7879beea as builder

WORKDIR /giropops-senhas

COPY src/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt --user

FROM cgr.dev/chainguard/python:latest@sha256:e5d8d4eb6975957350c8deb3afb09ea5328629d50a6916fc9863015fbfc0d8f8

WORKDIR /giropops-senhas

COPY --from=builder /home/nonroot/.local/lib/python3.12/site-packages /home/nonroot/.local/lib/python3.12/site-packages

COPY src/app.py src/tailwind.config.js ./
COPY src/static ./static
COPY src/templates ./templates

ENTRYPOINT [ "python", "-m" , "flask", "run", "--host=0.0.0.0" ]
