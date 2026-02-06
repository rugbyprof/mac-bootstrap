#!/usr/bin/env bash
set -e

source lib/logging.sh

log "Configuring macOS defaults"

########################################
# Finder
########################################

log "Finder: show all filename extensions"
run "defaults write NSGlobalDomain AppleShowAllExtensions -bool true"

log "Finder: use column view by default"
run "defaults write com.apple.finder FXPreferredViewStyle Clmv"

log "Finder: disable extension change warning"
run "defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false"

log "Finder: allow text selection in Quick Look"
run "defaults write com.apple.finder QLEnableTextSelection -bool true"

########################################
# Keyboard & Input
########################################

log "Keyboard: disable press-and-hold (enable key repeat)"
run "defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false"

log "Keyboard: faster key repeat"
run "defaults write NSGlobalDomain KeyRepeat -int 2"
run "defaults write NSGlobalDomain InitialKeyRepeat -int 15"

log "Keyboard: full keyboard access for dialogs"
run "defaults write NSGlobalDomain AppleKeyboardUIMode -int 3"

log "Keyboard: disable smart quotes, dashes, and double-space period"
run "defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false"
run "defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false"
run "defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false"

########################################
# Screenshots
########################################

log "Screenshots: set location to ~/Desktop/Screenshots"
run "mkdir -p \"$HOME/Desktop/Screenshots\""
run "defaults write com.apple.screencapture location -string \"$HOME/Desktop/Screenshots\""

log "Screenshots: PNG format"
run "defaults write com.apple.screencapture type -string png"

########################################
# General System Behavior
########################################

log "System: save new documents locally by default"
run "defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false"

log "System: disable smart quotes and dashes (code-friendly)"
run "defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false"
run "defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false"

########################################
# Dock (basic behavior only — layout later)
########################################

log "Dock: set icon size"
run "defaults write com.apple.dock tilesize -int 48"

log "Dock: auto-hide"
run "defaults write com.apple.dock autohide -bool true"

log "Dock: do not rearrange Spaces automatically"
run "defaults write com.apple.dock mru-spaces -bool false"

########################################
# Apply changes
########################################

log "Restarting affected services"
run "killall Finder || true"
run "killall Dock || true"

log "macOS defaults configured"
