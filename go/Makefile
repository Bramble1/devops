#Makefile

#VARIABLES
#_________________________________

SRC := ./*.go
BUILD_DIR := build
BINARY := $(BUILD_DIR)/myapp

#COMMANDS
#__________________________________

FORMAT := gofmt -s -w
FORMAT_TARGET := $(SRC)


LINT := golangci-lint run
LINT_TARGET := $(SRC)

BUILD := go build -o
BUILD_TARGET := $(BINARY) $(SRC)

TEST := go test -v
TEST_TARGET := $(SRC)

SECURITY := gosec
SECURITY_TARGET := ./...

VULNCHECK := govulncheck
VULNCHECK_TARGET := ./...



#phony targets (not actual files)
.PHONY: format lint build test clean security deps

#FORMAT
#____________________________________
format:
	@echo "[*]Formatting..."
	$(FORMAT) $(FORMAT_TARGET)
	goimports -w $(SRC)


#LINT & STATIC ANALYSIS
#____________________________________
lint:
	@echo "[*]Linting..."
	$(LINT) $(LINT_TARGET)


#BUILD/COMPILE
#_____________________________________
build:
	@echo "[*]Building..."
	mkdir -p $(BUILD_DIR)
	$(BUILD) $(BUILD_TARGET)

#TESTS
#______________________________________
test:
	@echo "[*]Testing..."
	$(TEST) $(TEST_TARGET) 

#SECURITY
#_____________________________________
security:
	@echo "[*]Security..."
	$(SECURITY) $(SECURITY_TARGET)

#DEPENDENCY & Vuln scan
#_____________________________________
deps:
	@echo "[*]Dependency scan..."
	$(VULNCHECK) $(VULNCHECK_TARGET)

#CLEAN build artifacts
#_____________________________________
clean:
	@echo "[*]Cleaning..."
	rm -rf $(BUILD_DIR)/*


