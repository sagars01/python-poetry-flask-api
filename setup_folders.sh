# Define shell
SHELL := /bin/bash

# Define project structure directories
SRC_DIR := src/gigyeah_ai_engine
TEMPLATES_DIR := $(SRC_DIR)/templates
STATIC_DIR := $(SRC_DIR)/static
MODELS_DIR := $(SRC_DIR)/models
VIEWS_DIR := $(SRC_DIR)/views

# Default target
all: init folders

# Initialize the Python project and install Flask
init:
	@echo "Initializing poetry project..."
	poetry new --src .
	@echo "Adding Flask..."
	poetry add flask

# Create project structure folders
folders:
	@echo "Creating project directories..."
	mkdir -p $(TEMPLATES_DIR)
	mkdir -p $(STATIC_DIR)
	mkdir -p $(MODELS_DIR)
	mkdir -p $(VIEWS_DIR)
	@echo "Creating __init__.py files to make packages..."
	touch $(SRC_DIR)/__init__.py
	touch $(MODELS_DIR)/__init__.py
	touch $(VIEWS_DIR)/__init__.py
	@echo "Setting up a basic Flask app in __init__.py..."
	echo "from flask import Flask\n\napp = Flask(__name__)\n\n@app.route('/')\ndef home():\n    return 'Hello, Flask!'" > $(SRC_DIR)/__init__.py

# Help target for describing the makefile
help:
	@echo "Makefile for setting up the Flask project structure"
	@echo "Targets:"
	@echo "  all: Initializes the poetry project, adds Flask, and creates the folder structure."
	@echo "  init: Initializes the poetry project and adds Flask as a dependency."
	@echo "  folders: Creates the directory structure for the project."
	@echo "  help: Displays this help message."

.PHONY: all init folders help
