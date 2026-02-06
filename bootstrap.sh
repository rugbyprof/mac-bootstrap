
#!/usr/bin/env bash
set -e

source config.sh
source lib/logging.sh

if [[ "$DRY_RUN" == true ]]; then
  warn "DRY RUN MODE ENABLED — no changes will be made"
fi

log "mac-bootstrap starting"

[[ "$INSTALL_BREW" == true ]]       && source brew/brew.sh
[[ "$INSTALL_PYTHON" == true ]]     && source python/python.sh
[[ "$RESTORE_SSH" == true ]]        && source ssh/ssh.sh
[[ "$CONFIGURE_MACOS" == true ]]    && source macos/defaults.sh
[[ "$CONFIGURE_GIT" == true ]]      && source git/git.sh
[[ "$CONFIGURE_DOCK" == true ]]     && source macos/dock.sh
[[ "$CONFIGURE_ZSH" == true ]]      && source zsh/zsh.sh
[[ "$CONFIGURE_OHMYZSH" == true ]]  && source zsh/ohmyzsh.sh


log "Bootstrap complete"


INSTALL_BREW=true
INSTALL_CASKS=true
INSTALL_MAS=false
INSTALL_PYTHON=true
INSTALL_PIPX=true
RESTORE_SSH_KEYS=true
CLONE_REPOS=true
CONFIGURE_GIT=true
CONFIGURE_MACOS=true
CONFIGURE_DOCK=true
CONFIGURE_ZSH=true
CONFIGURE_OHMYZSH=true