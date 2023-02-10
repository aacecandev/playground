# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

GIT_HASH ?= $(shell git log --format="%h" -n 1)
DOCKER_USERNAME ?= aacecandev
APPLICATION_NAME ?= store


build:
	docker build --tag ${DOCKER_USERNAME}/${APPLICATION_NAME}:${GIT_HASH} -f store/Dockerfile store

build-nc:
	docker build --no-cache -t $(APP_NAME) .

push:
	docker push ${DOCKER_USERNAME}/${APPLICATION_NAME}:${GIT_HASH}

release:
	docker pull ${DOCKER_USERNAME}/${APPLICATION_NAME}:${GIT_HASH}
	docker tag  ${DOCKER_USERNAME}/${APPLICATION_NAME}:${GIT_HASH} ${DOCKER_USERNAME}/${APPLICATION_NAME}:latest
	docker push ${DOCKER_USERNAME}/${APPLICATION_NAME}:latest

sign-image:
	cosign sign --yes --key env://COSIGN_PRIVATE_KEY ${DOCKER_USERNAME}/${APPLICATION_NAME}:${GIT_HASH}

sbom:
	syft attest --yes --config ./.syft.yaml ${DOCKER_USERNAME}/${APPLICATION_NAME}:${GIT_HASH}