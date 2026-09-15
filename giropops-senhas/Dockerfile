FROM cgr.dev/chainguard/python:latest-dev@sha256:3d1f8858036c90e826f267baa1abbfd1b59e16d23b0d58ee8d84f4f216375702 as builder

WORKDIR /giropops-senhas

COPY src/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt --user

FROM cgr.dev/chainguard/python:latest@sha256:e1a792bc1e72e6395fbf0504bd040945df8999e3e0b22728c279767f771a04ee

WORKDIR /giropops-senhas

COPY --from=builder /home/nonroot/.local/lib/python3.12/site-packages /home/nonroot/.local/lib/python3.12/site-packages

COPY src/app.py src/tailwind.config.js ./
COPY src/static ./static
COPY src/templates ./templates

ENTRYPOINT [ "python", "-m" , "flask", "run", "--host=0.0.0.0" ]
