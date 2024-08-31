FROM python:3.12.5-slim-bookworm

COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

WORKDIR /app

COPY pyproject.toml uv.lock README.md ./
COPY .git .git
COPY apps apps
COPY libs libs

RUN uv sync --python-preference=system --locked --no-dev --package=server
ENV PATH="/app/.venv/bin:$PATH"

CMD python -c "from una_example.server import run; run()"
