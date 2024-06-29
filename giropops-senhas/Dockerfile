FROM cgr.dev/chainguard/python:latest-dev@sha256:78c327ed9c3bb20fcef2226452b67c5071b03e51de35048acce21e4ae319e614 as builder

WORKDIR /giropops-senhas

COPY src/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt --user

FROM cgr.dev/chainguard/python:latest@sha256:9c774781fbaf008bbf43eeae6fd3aef61aed210b11033415a0fd635d4c684633

WORKDIR /giropops-senhas

COPY --from=builder /home/nonroot/.local/lib/python3.12/site-packages /home/nonroot/.local/lib/python3.12/site-packages

COPY src/app.py src/tailwind.config.js ./
COPY src/static ./static
COPY src/templates ./templates

ENTRYPOINT [ "python", "-m" , "flask", "run", "--host=0.0.0.0" ]
