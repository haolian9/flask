.PHONY: build init inspect clean

image := test/flaskr

build:
	docker build -t ${image} .

inspect: build
	docker run --rm -it ${image} bash

run: build
	docker run --rm -it -p 127.0.0.1:5000:5000 ${image}

clean:
	docker rmi ${image}
