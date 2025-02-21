FROM python:3.12-slim-bullseye AS py
LABEL org.opencontainers.image.authors="Ian Reppel" \
      org.opencontainers.image.source="https://github.com/ianreppel/docker-pip-tools" \
      org.opencontainers.image.vendor="Databaseline"

RUN pip install --no-cache-dir pip-tools

ENTRYPOINT ["/usr/local/bin/pip-compile"]
