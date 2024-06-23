.PHONY: build build-python push push-all push-python

all: build build-python push-all

build:
	docker build -t zeddee/toolbox:latest -f Dockerfile .

# Depends on published container zeddee/toolbox
build-python: push
	docker build -t zeddee/toolbox:python -f Dockerfile.python .

push: build
	docker push zeddee/toolbox:latest

push-all: build build-python
	docker push zeddee/toolbox -a

push-python: build-python
	docker push zeddee/toolbox:python



