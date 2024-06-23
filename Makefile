.PHONY: build build-python build-kube push push-all push-python push-kube

all: build build-python push-all

build:
	docker build -t zeddee/toolbox:latest -f Dockerfile .

# Depends on published container zeddee/toolbox
build-python: push
	docker build -t zeddee/toolbox:python -f Dockerfile.python .

build-kube: push
	docker build -t zeddee/toolbox:kube -f Dockerfile.kube .

push: build
	docker push zeddee/toolbox:latest

push-all: build build-python
	docker push zeddee/toolbox -a

push-python: build-python
	docker push zeddee/toolbox:python

push-kube: build-kube
	docker push zeddee/toolbox:kube



