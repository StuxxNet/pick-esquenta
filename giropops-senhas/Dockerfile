FROM cgr.dev/chainguard/python@sha256:96ad22648026103ba0bdfa095470a392ca04ca2b7aeaef4fe47b97fa56d384da as builder

WORKDIR /giropops-senhas

COPY src/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt --user

FROM cgr.dev/chainguard/python@sha256:c09ac5b32eebb821ac2d5d8872c3a73bd76ab5c5e6f8f70862f848a67a32964d

WORKDIR /giropops-senhas

COPY --from=builder /home/nonroot/.local/lib/python3.12/site-packages /home/nonroot/.local/lib/python3.12/site-packages

COPY src/app.py src/tailwind.config.js ./
COPY src/static ./static
COPY src/templates ./templates

ENTRYPOINT [ "python", "-m" , "flask", "run", "--host=0.0.0.0" ]
