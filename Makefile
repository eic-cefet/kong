all: build-plugins

build-plugins: build-plugin-go-powered-by build-plugin-go-seminaries-address

build-plugin-go-powered-by:
	cd plugins/go-powered-by && \
	go mod download && \
	go mod tidy && \
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -tags netgo -a -v -o ./go-powered-by main.go && \
	chmod +x go-powered-by && \
	mv ./go-powered-by ../builds/go-powered-by


build-plugin-go-seminaries-address:
	cd plugins/go-seminaries-address && \
	go mod download && \
	go mod tidy && \
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -tags netgo -a -v -o ./go-seminaries-address main.go && \
	chmod +x go-seminaries-address && \
	mv ./go-seminaries-address ../builds/go-seminaries-address

up:
	docker-compose up