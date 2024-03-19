# Local Development Guide

This detailed guide walks you through the steps to set up the `gigyeah-ai-engine` project for local development, including necessary shell commands and troubleshooting common issues.

## Prerequisites

Ensure you have Python 3.8+, Poetry, and Git installed on your machine.

## Setup and Running

### Clone the Project

```shell
git clone https://your-repository-url/gigyeah-ai-engine.git
cd gigyeah-ai-engine
```

### Install Dependencies

```shell
poetry install
```

This command installs all dependencies defined in `pyproject.toml`.

### Environment Variables Setup

Copy the `.env.example` file to `.env` and customize the values:

```shell
cp .env.example .env
```

Ensure `FLASK_APP` and `FLASK_ENV` are set correctly in `.env`:

```plaintext
FLASK_APP=src/gigyeah_ai_engine:create_app()
FLASK_ENV=development
```

### Activate Virtual Environment

```shell
poetry shell
```

### Start the Flask Development Server

```shell
flask run
```

Access the application at `http://127.0.0.1:5000/`.

## Common Errors and Fixes

### `ModuleNotFoundError` for `dotenv`

**Symptom:** Error message indicating that the `dotenv` module could not be found.

**Solution:**

Install `python-dotenv` using Poetry:

```shell
poetry add python-dotenv
```

### Flask Command Not Found

**Symptom:** Shell returns `flask: command not found` when trying to start the server.

**Solution:**

Ensure the Poetry virtual environment is activated:

```shell
poetry shell
```

If the problem persists, verify `FLASK_APP` is set in `.env` or export it directly in the terminal:

```shell
export FLASK_APP=src/gigyeah_ai_engine:create_app()
```

### Changes Not Reflecting

**Symptom:** Modifications to code do not appear when refreshing the browser.

**Solution:**

Ensure `FLASK_ENV` is set to `development` to enable auto-reload:

```shell
export FLASK_ENV=development
```

### `ModuleNotFoundError` for the Project Module

**Symptom:** Error message indicating the project module (`gigyeah_ai_engine`) could not be found.

**Solution:**

Ensure you're running the Flask or Gunicorn command from the root project directory. If using Gunicorn, consider using the `--chdir` option or setting the `PYTHONPATH`:

```shell
poetry run gunicorn --chdir src "gigyeah_ai_engine:create_app()"
```

or

```shell
export PYTHONPATH=$PYTHONPATH:/path/to/gigyeah-ai-engine/src
poetry run gunicorn "gigyeah_ai_engine:create_app()"
```

Adjust `/path/to/gigyeah-ai-engine` to your actual project path.

## Best Practices

- **Feature Branch Workflow:** Use Git branches for each new feature or bug fix.
- **Code Quality:** Regularly run `flake8`, `black`, and `isort` to maintain code quality.
- **Regular Commits:** Commit your changes often with meaningful messages.

Following this guide should streamline the local development setup for `gigyeah-ai-engine`, helping you avoid common pitfalls.
