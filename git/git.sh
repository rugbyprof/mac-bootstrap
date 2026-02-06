#!/usr/bin/env bash
set -e

source lib/logging.sh

log "Configuring Git globals"

run "git config --global user.name \"Terry Griffin\""
run "git config --global user.email \"$EMAIL\""

run "git config --global init.defaultBranch main"
run "git config --global pull.rebase false"

run "git config --global core.editor \"code --wait\""
run "git config --global credential.helper osxkeychain"

log "Git global config step complete"

if [[ \"$DRY_RUN\" != true ]]; then
  log "Git config summary:"
  git config --global --list
else
  log "DRY RUN: git config summary skipped"
fi
