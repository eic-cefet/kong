all: build-plugins

build-plugins: build-plugin-go-powered-by build-plugin-go-seminarios-address

build-plugin-go-powered-by:
	cd plugins/go-powered-by && \
	go mod download && \
	go mod tidy && \
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -tags netgo -a -v -o ./go-powered-by main.go && \
	chmod +x go-powered-by && \
	mv ./go-powered-by ../builds/go-powered-by


build-plugin-go-seminarios-address:
	cd plugins/go-seminarios-address && \
	go mod download && \
	go mod tidy && \
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -tags netgo -a -v -o ./go-seminarios-address main.go && \
	chmod +x go-seminarios-address && \
	mv ./go-seminarios-address ../builds/go-seminarios-address

up:
	docker-compose up