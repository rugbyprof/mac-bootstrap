log() {
  echo "▶ $1"
}

warn() {
  echo "⚠ $1"
}

die() {
  echo "❌ $1"
  exit 1
}

run() {
  if [[ "$DRY_RUN" == true ]]; then
    echo "🧪 DRY RUN → $*"
  else
    echo "▶ RUN → $*"
    eval "$@"
  fi
}


