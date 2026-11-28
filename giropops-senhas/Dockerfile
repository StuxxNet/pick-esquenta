FROM cgr.dev/chainguard/python:latest-dev@sha256:08141c5166ee89eac4b79d1ab4dc284c1796b5f264d66f0675742819ac511655 as builder

WORKDIR /giropops-senhas

COPY src/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt --user

FROM cgr.dev/chainguard/python:latest@sha256:884deb80d867bc984df53f9f2e2a205b9c2922c53ec992fcbeeb1ad7aad711c3

WORKDIR /giropops-senhas

COPY --from=builder /home/nonroot/.local/lib/python3.12/site-packages /home/nonroot/.local/lib/python3.12/site-packages

COPY src/app.py src/tailwind.config.js ./
COPY src/static ./static
COPY src/templates ./templates

ENTRYPOINT [ "python", "-m" , "flask", "run", "--host=0.0.0.0" ]
