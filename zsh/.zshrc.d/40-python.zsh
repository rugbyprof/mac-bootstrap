# ─────────────────────────────────────────────
# FILE: 40-python.zsh
# PURPOSE: Python tooling, venv helpers, pipx paths
# ─────────────────────────────────────────────

# Virtual environment helpers
create-venv() { python3 -m venv .venv; }

# Filename sanitation
sp2under() {
  [[ $# -ne 1 ]] && echo "Usage: sp2under <filename>" && return 1
  local new="${1// /_}"
  [[ "$1" != "$new" ]] && mv "$1" "$new"
}

# ⚠️ DUPLICATE REMOVED
# sp2under was defined twice in original — keep only once

# pipx / local bins
export PATH="$PATH:$HOME/.local/bin"

# # pyenv (optional)
# # RECOMMEND: keep, but do not auto-install via bootstrap
# if command -v pyenv >/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi
