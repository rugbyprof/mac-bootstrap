#!/usr/bin/env bash
set -e

source lib/logging.sh

log "Configuring Dock layout"

# Ensure dockutil exists
if ! command -v dockutil >/dev/null; then
  die "dockutil not found (should be installed via Homebrew)"
fi

########################################
# Dock behavior (safe, supported)
########################################

log "Dock behavior: size, auto-hide, space ordering"

run "defaults write com.apple.dock tilesize -int 48"
run "defaults write com.apple.dock autohide -bool true"
run "defaults write com.apple.dock mru-spaces -bool false"

########################################
# Reset Dock (this is intentional)
########################################

log "Clearing existing Dock items"
run "dockutil --no-restart --remove all"

########################################
# App Groups
########################################

log "Adding browser group"
run "dockutil --no-restart --add /Applications/Google\\ Chrome.app"
run "dockutil --no-restart --add /Applications/Firefox.app"

log "Adding development tools"
run "dockutil --no-restart --add /Applications/Visual\\ Studio\\ Code.app"
run "dockutil --no-restart --add /Applications/iTerm.app"

log "Adding productivity tools"
run "dockutil --no-restart --add /Applications/Obsidian.app"
run "dockutil --no-restart --add /Applications/Slack.app"
run "dockutil --no-restart --add /Applications/Zoom.app"

########################################
# Utility folders (right side of Dock)
########################################

log "Adding utility folders"
run "dockutil --no-restart --add \"$HOME/Downloads\" --view grid --display folder --section others"
run "dockutil --no-restart --add \"$HOME/Desktop\" --view grid --display folder --section others"

########################################
# Apply changes
########################################

log "Restarting Dock"
run "killall Dock || true"

log "Dock layout configured"
