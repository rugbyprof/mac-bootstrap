#!/usr/bin/env bash
set -e

source lib/logging.sh

log "Ensuring Oh-My-Zsh is installed"

ZSH_DIR="$HOME/.oh-my-zsh"
CUSTOM_DIR="$ZSH_DIR/custom"
PLUGIN_DIR="$CUSTOM_DIR/plugins"
THEME_DIR="$CUSTOM_DIR/themes"

########################################
# Install Oh-My-Zsh (if missing)
########################################

if [[ -d "$ZSH_DIR" ]]; then
  log "Oh-My-Zsh already installed"
else
  log "Oh-My-Zsh not found"

  # Critical: prevent installer from touching .zshrc or changing shell
  export RUNZSH=no
  export CHSH=no
  export KEEP_ZSHRC=yes

  run "sh -c \"$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
fi

########################################
# Ensure custom directories exist
########################################

run "mkdir -p \"$PLUGIN_DIR\""
run "mkdir -p \"$THEME_DIR\""

########################################
# Plugins
########################################

log "Ensuring Oh-My-Zsh plugins"

# zsh-autosuggestions
if [[ -d \"$PLUGIN_DIR/zsh-autosuggestions\" ]]; then
  log "zsh-autosuggestions already present"
else
  run "git clone https://github.com/zsh-users/zsh-autosuggestions \"$PLUGIN_DIR/zsh-autosuggestions\""
fi

# zsh-syntax-highlighting
if [[ -d \"$PLUGIN_DIR/zsh-syntax-highlighting\" ]]; then
  log "zsh-syntax-highlighting already present"
else
  run "git clone https://github.com/zsh-users/zsh-syntax-highlighting \"$PLUGIN_DIR/zsh-syntax-highlighting\""
fi

########################################
# Themes (custom)
########################################

log "Ensuring custom themes"

# griffin theme (example placeholder)
if [[ -f \"$THEME_DIR/griffin.zsh-theme\" ]]; then
  log "griffin theme already present"
else
  warn "griffin theme not found — expected to be provided by repo or user"
fi

log "Oh-My-Zsh setup complete (reload shell to activate)"
