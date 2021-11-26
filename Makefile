all: build-plugins

build-plugins: build-plugin-go-powered-by

build-plugin-go-powered-by:
	cd plugins/go-powered-by && \
	go mod download && \
	go mod tidy && \
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -tags netgo -a -v -o ./go-powered-by main.go

up:
	docker-compose up