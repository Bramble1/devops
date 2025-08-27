all: test mutation-test format lint security


test:
	PYTHONPATH=src pytest --cov=src tests/
	rm *.pem

mutation-test:
	PYTHONPATH=.
	mutmut run --max-children 20
	mutmut results --all true
	rm -r mutants/

format:
	black src/ tests/

lint:
	flake8 src/ tests/ --exclude=venv --max-line-length 200

security:
	bandit --exclude "venv" src/*.py -s B104

dependency_scan:
	safety --key "$(key)" scan -r src/requirements.txt


load_test:
	PYTHONPATH=src locust -f load_testing/load_test.py --headless --users 10 --spawn-rate 10 --run-time 35s --host=https://20.162.98.77

help:
	@echo "all - run all commands"
	@echo "test - test the application"
	@echo "mutation-test - perfrom mutation tests"
	@echo "format - format the application"
	@echo "lint - lint the application"
	@echo "security - perform security checks"
	@echo "load_test - load test deployed application

.PHONY: all test mutation-test format lint security help
