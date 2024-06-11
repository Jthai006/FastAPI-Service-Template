# Define variables
PYTHON := python3
PIP := pip
UVICORN := uvicorn
PROJECT_NAME := fastapi_template
APP_MODULE := app.main:app
HOST := 127.0.0.1
PORT := 8000
ENV_FILE := .env

# Define commands
.PHONY: help install run test lint format clean lint-format

help:  ## Show this help.
	@echo "Makefile commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

install: ## Install the required dependencies.
	@$(PIP) install -r requirements.txt

run: ## Run the FastAPI server.
	@$(UVICORN) $(APP_MODULE) --reload --host $(HOST) --port $(PORT)

test: ## Run the tests using pytest.
	pytest

lint: ## Run linters (flake8).
	@flake8 app tests

format: ## Format code using black.
	@black app

clean: ## Clean up the project directory.
	@find . -type f -name "*.pyc" -delete
	@find . -type d -name "__pycache__" -delete

lint-format: format lint ## Format and then lint the code.
