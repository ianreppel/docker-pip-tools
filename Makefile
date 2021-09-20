.ONESHELL:
SHELL := /bin/bash
.SHELLFLAGS = -ec

IMAGE_NAME = databaseline/pip-compile
IMAGE_TAG = $(shell git describe --tags --abbrev=0 2&>/dev/null || echo 'latest')

.PHONY: help check scan build push pr all

help:
	@echo "Makefile arguments:"
	@echo ""
	@echo "tag - Docker image tag"
	@echo ""
	@echo "Makefile commands:"
	@echo "tag VERSION=X.Y.Z  - git-tag the code base with X.Y.Z"
	@echo "build              - build the container image with the last available git tag"
	@echo "check              - check the Dockerfile"
	@echo "scan               - scan the container image for vulnerabilities"
	@echo "push               - push to Docker Hub with the last available git tag"
	@echo "pr                 - check, build"
	@echo "all                - check, build, push"

.DEFAULT_GOAL := build

tag:
	git tag $(VERSION)

check:
	docker run --pull always --rm -i -v $(shell pwd)/hadolint.yaml:/.config/hadolint.yaml hadolint/hadolint < Dockerfile

scan:
	docker run --pull always --rm -i -v /var/run/docker.sock:/var/run/docker.sock anchore/grype $(IMAGE_NAME):$(IMAGE_TAG)

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) -t $(IMAGE_NAME):latest .

run:
	docker run --rm -it -v $(shell pwd):/app -w /app databaseline/pip-compile:latest requirements.in

push:
	docker push $(IMAGE_NAME):$(IMAGE_TAG)

pr: check build

all: pr push
