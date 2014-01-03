build:
ifdef LOCAL
	make build/app
	make build/sdutil
else
	mkdir -p build && tar -cf - . | docker run -i -a stdin -a stdout -e=GOPATH=/tmp/go titanous/makebuilder makebuild go/src/github.com/flynn/example-job | tar -xC build
endif

build/app:
	go build -o build/app

build/sdutil:
	mkdir -p tmp
	cd tmp && git clone https://github.com/flynn/sdutil.git
	GOPATH=. cd tmp/sdutil && go get || true && go build -o ../../build/sdutil
	rm -rf tmp

container: build
	docker build -t flynn/example-job .

clean:
	rm -rf build tmp

.PHONY: build tmp