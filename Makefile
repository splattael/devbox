
NAME=devbox

build:
	docker build -t ${NAME} .

force-build:
	docker build --no-cache -t ${NAME} .

shell: build
	docker run -it --rm -u root -v `pwd`:/src ${NAME} bash
