
#!/usr/bin/env bash
set -e

source config.sh
source lib/logging.sh

if [[ "$DRY_RUN" == true ]]; then
  warn "DRY RUN MODE ENABLED — no changes will be made"
fi

log "mac-bootstrap starting"

[[ "$INSTALL_BREW" == true ]]   && source brew/brew.sh
[[ "$INSTALL_PYTHON" == true ]] && source python/python.sh
[[ "$RESTORE_SSH" == true ]]    && source ssh/ssh.sh
source git/git.sh

log "Bootstrap complete"
