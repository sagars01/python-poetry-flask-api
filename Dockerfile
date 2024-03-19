# syntax=docker/dockerfile:1

FROM python:3.8-slim as base
WORKDIR /app
COPY pyproject.toml poetry.lock* /app/
RUN pip install poetry && \
    poetry config virtualenvs.create false && \
    poetry install --no-root --no-dev
COPY . /app

# Stage 2: Development build
FROM base as development
RUN poetry install --no-root
CMD ["flask", "run", "--host=0.0.0.0"]

# Stage 3: Production build
FROM base as production
RUN poetry install --no-root --no-interaction --no-ansi
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "gigyeah_ai_engine:create_app()"]
