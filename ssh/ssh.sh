#!/usr/bin/env bash
set -e
source lib/logging.sh

log "Setting up SSH"

SSH_DIR="$HOME/.ssh"
IMPORT_DIR="$HOME/Desktop/installer_files/ssh"
KEY="$SSH_DIR/id_ed25519"

run "mkdir -p $SSH_DIR"
run "chmod 700 $SSH_DIR"

if [[ -f "$KEY" ]]; then
  log "SSH key already exists, leaving it alone"

elif [[ -d "$IMPORT_DIR" && -f "$IMPORT_DIR/id_ed25519" ]]; then
  log "Would import existing SSH keys from $IMPORT_DIR"
  run "cp $IMPORT_DIR/id_ed25519* $SSH_DIR/"
  run "chmod 600 $SSH_DIR/id_ed25519"
  run "chmod 644 $SSH_DIR/id_ed25519.pub"

else
  log "Would generate new SSH key"
  run "ssh-keygen -t ed25519 -C \"$EMAIL\" -f \"$KEY\" -N \"\""
fi

log "SSH step complete"
