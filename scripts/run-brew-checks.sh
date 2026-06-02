#!/usr/bin/env bash
set -euo pipefail

formula_paths=()
formula_names=()
cask_paths=()
cask_names=()

for path in "$@"; do
  case "$path" in
    Formula/*.rb)
      formula_paths+=("$path")
      formula_names+=("dewab-org/custom/$(basename "${path%.rb}")")
      ;;
    Casks/*.rb)
      cask_paths+=("$path")
      cask_names+=("dewab-org/custom/$(basename "${path%.rb}")")
      ;;
  esac
done

if [[ ${#formula_paths[@]} -eq 0 && ${#cask_paths[@]} -eq 0 ]]; then
  echo "No formula or cask files to check." >&2
  exit 0
fi

if [[ ${#formula_paths[@]} -gt 0 ]]; then
  brew style "${formula_paths[@]}"
  brew audit --strict --online "${formula_names[@]}"
fi

if [[ ${#cask_paths[@]} -gt 0 ]]; then
  brew style "${cask_paths[@]}"
  brew audit --cask --online "${cask_names[@]}"
fi
