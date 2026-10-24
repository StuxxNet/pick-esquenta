FROM cgr.dev/chainguard/python:latest-dev@sha256:c179c7d8e23caed59a51ff74d4742f8f8d3f16af4c33c40acaf8d3ee07234592 as builder

WORKDIR /giropops-senhas

COPY src/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt --user

FROM cgr.dev/chainguard/python:latest@sha256:fd6d0771e8ec99b1710dfc3d72ca19ba2ff6b14f72b7978922ab0c8acb72c3f3

WORKDIR /giropops-senhas

COPY --from=builder /home/nonroot/.local/lib/python3.12/site-packages /home/nonroot/.local/lib/python3.12/site-packages

COPY src/app.py src/tailwind.config.js ./
COPY src/static ./static
COPY src/templates ./templates

ENTRYPOINT [ "python", "-m" , "flask", "run", "--host=0.0.0.0" ]
