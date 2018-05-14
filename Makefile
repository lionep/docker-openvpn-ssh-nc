DOCKER_IMAGE := lionep/openvpn-ssh-nc
IMAGE_VERSION := 2.4
BASE_IMAGE := kylemanna/openvpn:2.4

all: build

bash:
	@docker run --entrypoint /bin/bash --privileged --rm -it ${DOCKER_IMAGE}

build:
	@docker build --build-arg IMAGE_VERSION=${IMAGE_VERSION} --tag=${DOCKER_IMAGE}:latest .

base:
	@docker pull ${BASE_IMAGE}

rebuild: base
	@docker build --build-arg IMAGE_VERSION=${IMAGE_VERSION} --tag=${DOCKER_IMAGE}:latest .

release: rebuild
	@docker build --build-arg IMAGE_VERSION=${IMAGE_VERSION} --tag=${DOCKER_IMAGE}:${IMAGE_VERSION} .
	@scripts/tag.sh ${DOCKER_IMAGE} ${IMAGE_VERSION}

push:
	@scripts/push.sh ${DOCKER_IMAGE} ${IMAGE_VERSION}

