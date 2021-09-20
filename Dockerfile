FROM python:3.7-slim-buster AS py

RUN pip install --no-cache-dir pip-tools

#FROM gcr.io/distroless/python3:nonroot
#COPY --from=py /usr/local/lib/python3.7/site-packages /site-packages
#COPY --from=py /usr/local/bin/pip-compile /pip-compile
#
#ENV PYTHONPATH=/site-packages
#ENV LANG C.UTF-8
#
#LABEL org.opencontainers.image.authors="Ian Hellström" \
#      org.opencontainers.image.source="https://github.com/ianhellstrom/docker-pip-tools" \
#      org.opencontainers.image.vendor="Databaseline"

ENTRYPOINT ["/usr/local/bin/pip-compile"]
