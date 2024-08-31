FROM python:3.12.5-slim-bookworm AS build

COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

WORKDIR /build

# Install requirements
# generate by running
# uv export --format=requirements-txt  --locked --no-dev --package=server > requirements.txt
COPY requirements.txt requirements.txt
RUN sed -i '/^-e ./d' requirements.txt
RUN uv pip install --system -r requirements.txt

# now install the wheel itself (with deps already installed)
# --no-index prevents this from looking up any unmet requirements
# so will fail (which is good) if anything missing from requirements.txt
COPY dist dist
RUN uv pip install dist/*.whl --no-deps --no-index --system

FROM python:3.12.5-slim-bookworm AS run
COPY --from=build /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY --from=build /usr/local/bin /usr/local/bin

# This is possible because of the project.scripts in apps/server/pyproject.toml
# CMD ["una_server"]
# OR CMD ["python", "-c", "from una_example.server import run; run()"]
CMD ["uvicorn", "una_example.server:app", "--host=0.0.0.0", "--port=8000"]
