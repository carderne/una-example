all: fmt lint check test

fmt:
	@uv run ruff format

fmt-check:
	uv run ruff format --check

lint:
	uv run ruff check --fix

lint-check:
	uv run ruff check

check:
	uv run basedpyright

test:
	uv run pytest

build:
	uvx --from build pyproject-build --installer=uv --wheel --outdir=dist apps/server

build-docker: build
	uv export --format=requirements-txt  --locked --no-dev --package=server > requirements.txt
	docker build --tag example .

run-docker: build-docker
  docker run --rm -p 8000:8000 -it example
