#!/usr/bin/env bash
set -e

source lib/logging.sh

log "Setting up SSH"

SSH_DIR="$HOME/.ssh"
IMPORT_DIR="$HOME/Desktop/installer_files/ssh"
KEY="$SSH_DIR/id_ed25519"

mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

if [[ -f "$KEY" ]]; then
  log "SSH key already exists, leaving it alone"

elif [[ -d "$IMPORT_DIR" && -f "$IMPORT_DIR/id_ed25519" ]]; then
  log "Importing existing SSH keys from $IMPORT_DIR"
  cp "$IMPORT_DIR"/id_ed25519* "$SSH_DIR/"
  chmod 600 "$SSH_DIR"/id_ed25519
  chmod 644 "$SSH_DIR"/id_ed25519.pub

else
  log "No existing key found — generating new SSH key"
  ssh-keygen -t ed25519 -C "$EMAIL" -f "$KEY" -N ""
fi

log "SSH setup complete"
log "Public key:"
cat "$SSH_DIR/id_ed25519.pub"
