FROM cgr.dev/chainguard/python:latest-dev@sha256:64f414bffa25ca9ff518f35975ad153a921b2e4850c4a84c31a96885fdb86a02 as builder

WORKDIR /giropops-senhas

COPY src/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt --user

FROM cgr.dev/chainguard/python:latest@sha256:f3e5face39b0acd813fae456df27b33bf6a6bffba5d201d15f6498138cb8fd96

WORKDIR /giropops-senhas

COPY --from=builder /home/nonroot/.local/lib/python3.12/site-packages /home/nonroot/.local/lib/python3.12/site-packages

COPY src/app.py src/tailwind.config.js ./
COPY src/static ./static
COPY src/templates ./templates

ENTRYPOINT [ "python", "-m" , "flask", "run", "--host=0.0.0.0" ]
