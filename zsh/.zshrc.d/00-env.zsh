# ─────────────────────────────────────────────
# FILE: 00-env.zsh
# PURPOSE: Core environment variables & paths
# Loaded first. Should be safe, boring, and stable.
# No aliases, no functions, no user-specific mounts.
# ─────────────────────────────────────────────

# Fix Python SSL on Homebrew installs
# NOTE: Requires certifi; safe if python exists, harmless if not
export SSL_CERT_FILE="$(python3 -m certifi 2>/dev/null)"

# Homebrew (Apple Silicon)
# NOTE: Must be early in PATH
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# Core editor
export EDITOR="nano"

# TeX input paths
# NOTE: Keep only if you actively use custom TeX configs
export TEXINPUTS="$HOME/.TexConfigs//:"

# ─────────────────────────────────────────────
# ⚠️ RECOMMEND MOVE → 90-local.zsh
# Reason: LD_LIBRARY_PATH is fragile on macOS and often SIP-ignored.
# Keep only if you *know* you need it on this machine.
# ─────────────────────────────────────────────
# export LD_LIBRARY_PATH="/usr/local/bin/SFML-2.5.0-macOS-clang/lib:$LD_LIBRARY_PATH"
