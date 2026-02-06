#!/usr/bin/env bash
set -e

source lib/logging.sh

log "Setting up Python tooling (pipx)"

########################################
# pipx availability
########################################

if ! command -v pipx >/dev/null; then
  if [[ "$DRY_RUN" == true ]]; then
    warn "pipx not found — would be installed via Homebrew in real run"
  else
    die "pipx not found (should be installed via Homebrew)"
  fi
fi

########################################
# PATH handling
########################################

log "Ensuring pipx paths"
run "pipx ensurepath"

########################################
# Python CLI tools
########################################

log "Installing Python CLI tools via pipx"

run "pipx install black"       || true  # code formatter
run "pipx install ruff"        || true  # fast linter
run "pipx install ipython"     || true  # better REPL
run "pipx install pre-commit"  || true  # git hook manager
run "pipx install poetry"      || true  # Python packaging / dependency manager

########################################
# Summary
########################################

if [[ "$DRY_RUN" != true ]]; then
  log "pipx-installed tools:"
  pipx list
else
  log "DRY RUN: pipx list skipped"
fi

log "Python CLI tooling step complete"
