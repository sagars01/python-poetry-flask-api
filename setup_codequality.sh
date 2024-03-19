#!/bin/bash

# Ensure the script is executed from the project root
if [ ! -f "pyproject.toml" ]; then
    echo "Error: pyproject.toml not found. Please run this script from the project root."
    exit 1
fi

# Add development dependencies
echo "Adding development dependencies..."
poetry add --dev flake8 black isort pytest

# Create configuration for Flake8
echo "[flake8]
max-line-length = 88
exclude = .git,__pycache__,__init__.py,.mypy_cache,.pytest_cache,venv,env,.venv" > .flake8

# Configure Black to be compatible with Flake8's line length
echo "[tool.black]
line-length = 88
target-version = ['py38']
include = '\.pyi?$'
exclude = '''(
  /(
      \.git
    | \.mypy_cache
    | \.pytest_cache
    | \.venv
    | env
    | venv
    | __pycache__
  )/
)'''" > pyproject.toml

# Configure isort to be compatible with Black
echo "[tool.isort]
profile = 'black'" >> pyproject.toml

# Optionally, you can set up a basic pytest test structure
mkdir -p tests
touch tests/__init__.py
echo "def test_example():
    assert True" > tests/test_example.py

echo "Setup completed. You can now use 'poetry run flake8', 'poetry run black .', 'poetry run isort .' and 'poetry run pytest' for code quality checks and testing."
