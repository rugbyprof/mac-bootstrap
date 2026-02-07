# ─────────────────────────────────────────────
# FILE: 10-ohmyzsh.zsh
# PURPOSE: oh-my-zsh configuration & shell behavior
# ─────────────────────────────────────────────

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="griffin"   # your custom theme
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

# Sane shell behavior
setopt autocd
setopt correct
setopt hist_ignore_dups
setopt share_history

# iTerm integration (safe conditional)
[[ -e "$HOME/.iterm2_shell_integration.zsh" ]] \
  && source "$HOME/.iterm2_shell_integration.zsh"
