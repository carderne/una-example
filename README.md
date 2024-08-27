# una-example

This is an example of an [una](https://github.com/carderne/una) monorepo.

Read more about una:
- [Official docs](https://una.rdrn.me/)

## About
This repository is basically the result of the following steps:
```bash
uv init una-example
cd una-example
git init
uv add --dev una
uv run una create workspace
uv sync
uv run una sync
uv add --dev basedpyright pytest
```

And then some extra settings added to all the `pyproject.toml` files to get Pyright and Pytest to play nice.

## Commands
Sync the una dependency graph (that is, resolve all dependencies between packages in the monorepo):
```bash
uv run una sync
```

Formatting, linting etc (these are specified at the top of the root [pyproject.toml](./pyproject.toml)).
```bash
make fmt
make lint
make check
make test

make all
```

## Building
Build wheels (outputs to `dist/`):
```bash
make build
```
