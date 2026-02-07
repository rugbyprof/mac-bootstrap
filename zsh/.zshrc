# ~/.zshrc
ZSHRC_DIR="$HOME/.zshrc.d"

if [[ -d "$ZSHRC_DIR" ]]; then
  for file in "$ZSHRC_DIR"/*.zsh; do
    [[ -r "$file" ]] && source "$file"
  done
fi
