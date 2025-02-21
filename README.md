# Dockerized `pip-tools` for Python 3

[![Master CI](https://github.com/ianreppel/docker-pip-tools/actions/workflows/merge.yml/badge.svg)](https://github.com/ianreppel/docker-pip-tools/actions/workflows/merge.yml)
[![PR CI](https://github.com/ianreppel/docker-pip-tools/actions/workflows/pull.yml/badge.svg)](https://github.com/ianreppel/docker-pip-tools/actions/workflows/pull.yml)

`docker-pip-tools` provides a Dockerized `pip-tools` for Python 3.
Simply run it against a `requirements.in` file and it will generate the `requirements.txt` file with
all package versions pinned.

```bash
docker run --pull always --rm -it \
  -v $(pwd):$(pwd) -w $(pwd) \
  databaseline/pip-compile requirements.in
```

If you intend to run `docker-pip-tools` from a Makefile, please remember to use use `$(shell pwd)`
instead of plain ol' `$(pwd)`.

The entry point of the container is [`pip-compile`](https://pypi.org/project/pip-tools/).
