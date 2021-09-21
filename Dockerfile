FROM python:3.7-slim-buster AS py
LABEL org.opencontainers.image.authors="Ian Hellström" \
      org.opencontainers.image.source="https://github.com/ianhellstrom/docker-pip-tools" \
      org.opencontainers.image.vendor="Databaseline"

RUN pip install --no-cache-dir pip-tools

ENTRYPOINT ["/usr/local/bin/pip-compile"]
