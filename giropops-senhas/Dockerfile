FROM cgr.dev/chainguard/python:latest-dev@sha256:075c08ad4c1d529dfb0ee3aaeab034268c912771256132765bb0751d0dba6572 as builder

WORKDIR /giropops-senhas

COPY src/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt --user

FROM cgr.dev/chainguard/python:latest@sha256:e8525291a96a1bbd9e6e2006633b78f8105e0cdefd12e678f425ff703d73bfdf

WORKDIR /giropops-senhas

COPY --from=builder /home/nonroot/.local/lib/python3.12/site-packages /home/nonroot/.local/lib/python3.12/site-packages

COPY src/app.py src/tailwind.config.js ./
COPY src/static ./static
COPY src/templates ./templates

ENTRYPOINT [ "python", "-m" , "flask", "run", "--host=0.0.0.0" ]
