#!/usr/bin/env bash
set -e
source lib/logging.sh

log "Checking for Homebrew"

if ! command -v brew >/dev/null; then
  log "Homebrew not found"
  run "/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
fi

run "eval \"\$(/opt/homebrew/bin/brew shellenv)\""
run "brew update"
run "brew bundle --file=brew/Brewfile"

log "Homebrew setup complete"
