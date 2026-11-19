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
brew install dewab-org/custom/hme

# Casks
brew install --cask dewab-org/custom/dockutil
```

## Packages

- **sshpass** (formula) — Enables non-interactive SSH password auth (use cautiously; SSH keys are preferred).
- **mping** (formula) — Terminal UI for multi-host ping monitoring with theming and manpage support.
- **hme** (formula) — CLI for iCloud Hide My Email addresses: generate, list and delete them, with optional 1Password integration.
- **dockutil** (cask) — Newer dockutil pkg for automating macOS dock changes (used by Geerlingguy's dock role).

## Development

`master` is protected by repository rulesets: it cannot be deleted or
force-pushed, so changes are pushed as normal fast-forward commits. `v*`
tags, if any are ever used, can only be created by admins and can never
be moved or deleted. GitHub secret scanning with push protection is on, so a
push containing a recognised credential is refused. CodeQL code scanning
checks the Ruby on every push and weekly, and Dependabot alerts and
security updates are on.

`Formula/hme.rb` is updated automatically: each release of
[hide-my-email](https://github.com/dewab74/hide-my-email) pushes it here
through a deploy key that can write to this repository only. Edit it in
that project's `scripts/update-formula.sh`, not here.

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
