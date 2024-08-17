# una-example-packages

This is an example of an [una](https://github.com/carderne/una) monorepo using the Packages style.

Read more about una:
- [Official docs](https://una.rdrn.me/)
- [Official docs on the Packages style](https://una.rdrn.me/style-packages/)

## About
This repository is basically the result of the following steps:
```bash
rye init una-example-packages
cd una-example-packages
rye add --dev una
rye run una create workspace
rye sync
rye run una sync
rye add --dev basedpyright pytest
```

And then some extra settings added to all the `pyproject.toml` files to get Pyright and Pytest to play nice.

## Commands
Sync the una dependency graph (that is, resolve all dependencies between packages in the monorepo):
```bash
rye run una sync
```

Formatting, linting etc (these are specified at the top of the root [pyproject.toml](./pyproject.toml)).
```bash
rye run fmt
rye run lint
rye run check
rye run test

# or just
rye run all
```

## Building
Build wheels (outputs to `dist/`):
```bash
rye run build
```
