
#!/usr/bin/env bash
set -e

source config.sh
source lib/logging.sh

if [[ "$DRY_RUN" == true ]]; then
  warn "DRY RUN MODE ENABLED — no changes will be made"
fi

log "mac-bootstrap starting"

[[ "$INSTALL_BREW" == true ]]     && source brew/brew.sh
[[ "$INSTALL_PYTHON" == true ]]   && source python/python.sh
[[ "$RESTORE_SSH" == true ]]      && source ssh/ssh.sh
[[ "$CONFIGURE_MACOS" == true ]]  && source macos/defaults.sh
[[ "$CONFIGURE_GIT" == true ]]    && source git/git.sh
[[ "$CONFIGURE_DOCK" == true ]]   && source macos/dock.sh



log "Bootstrap complete"


