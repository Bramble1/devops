#use the golang image
FROM golang:1.25.0-bookworm

#set working directory inside container
WORKDIR /workspace

#install basic tools
RUN apt update && \
	apt install -y --no-install-recommends \
	git \
	curl \
	ca-certificates \
	make \
	wget \
	unzip \
	gcc \
	build-essential \
	&& rm -rf /var/lib/apt/lists/*

#add go bin to path
ENV PATH=$PATH:$GOPATH/bin
ENV PATH=$PATH:/root/go/bin

#RUN GOBIN=/usr/local/bin go install golang.org/x/tools/cmd/goimports@latest
RUN GOBIN=/root/go/bin go install golang.org/x/tools/cmd/goimports@latest
RUN GOBIN=/root/go/bin go install golang.org/x/vuln/cmd/govulncheck@latest

RUN curl -sfL https://raw.githubusercontent.com/securego/gosec/master/install.sh | sh -s -- -b $(go env GOPATH)/bin

#install go tools for CI
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/HEAD/install.sh | sh -s -- -b $(go env GOPATH)/bin v2.4.0
#RUN go install golang.org/x/tools/cmd/goimports@latest \
#	golang.org/x/lint/golint@latest \
#	github.com/golangci/golangci-lint/cmd/golangci-lint@latest \
#	github.com/securego/gosec/v2/cmd/gosec@latest \
#	golang.org/x/vuln/cmd/govulncheck@latest

#Add go bin to path
#ENV PATH=$PATH:/go/bin

#Default command is make , can be overriden in pipeline
CMD ["make"]
