FROM cgr.dev/chainguard/python:latest-dev@sha256:c0328ed1997b6826d7d2ae4ea972345d3487a80f15ceb1d26f211f7c02f8c177 as builder

WORKDIR /giropops-senhas

COPY src/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt --user

FROM cgr.dev/chainguard/python:latest@sha256:4b2cec05cea94a58e635f21ca5d7c642d24ec58258008bf9341a0c062de5d99d

WORKDIR /giropops-senhas

COPY --from=builder /home/nonroot/.local/lib/python3.12/site-packages /home/nonroot/.local/lib/python3.12/site-packages

COPY src/app.py src/tailwind.config.js ./
COPY src/static ./static
COPY src/templates ./templates

ENTRYPOINT [ "python", "-m" , "flask", "run", "--host=0.0.0.0" ]
