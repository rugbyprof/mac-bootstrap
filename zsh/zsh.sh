#!/usr/bin/env bash
set -e
source lib/logging.sh

log "Setting up Zsh configuration"

ZSHRC_DIR="$HOME/.zshrc.d"

run "mkdir -p $ZSHRC_DIR"

for file in zsh/zshrc.d/*.zsh; do
  base=$(basename "$file")
  run "cp \"$file\" \"$ZSHRC_DIR/$base\""
done

log "Zsh config installed (reload shell to apply)"
