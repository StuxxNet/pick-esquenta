FROM cgr.dev/chainguard/python:latest-dev@sha256:47b1a23ae387fc1d5264abd79c395827fcca7ef92afe086908b51ce0747e8e77 as builder

WORKDIR /giropops-senhas

COPY src/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt --user

FROM cgr.dev/chainguard/python:latest@sha256:c26e4957fef58d936401b8e2bb9ccb6db0f404f51597a0d2c7586e1d0112df0a

WORKDIR /giropops-senhas

COPY --from=builder /home/nonroot/.local/lib/python3.12/site-packages /home/nonroot/.local/lib/python3.12/site-packages

COPY src/app.py src/tailwind.config.js ./
COPY src/static ./static
COPY src/templates ./templates

ENTRYPOINT [ "python", "-m" , "flask", "run", "--host=0.0.0.0" ]
