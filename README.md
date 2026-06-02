# My Homebrew Custom Packages

Custom tap for a few tools I rely on but are not available (or current enough) in Homebrew core.

## Quick start

```sh
brew tap dewab-org/custom
```

Install packages directly from the tap:

```sh
# Formulas
brew install dewab-org/custom/sshpass
brew install dewab-org/custom/mping

# Casks
brew install --cask dewab-org/custom/dockutil
```

## Packages

- **sshpass** (formula) — Enables non-interactive SSH password auth (use cautiously; SSH keys are preferred).
- **mping** (formula) — Terminal UI for multi-host ping monitoring with theming and manpage support.
- **dockutil** (cask) — Newer dockutil pkg for automating macOS dock changes (used by Geerlingguy's dock role).

## Development

- Style checks: `brew style Formula/*.rb Casks/*.rb`
- Audits: `brew audit --strict --online Formula/*.rb` and `brew audit --cask --online Casks/*.rb`

### Pre-commit (optional)

1. `pipx install pre-commit` (or `pip install pre-commit`)
2. `pre-commit install`
3. Commit as usual; `brew style` and `brew audit` will run on changed formulas/casks.

You can run the checks manually at any time with:

```sh
pre-commit run --all-files
```
