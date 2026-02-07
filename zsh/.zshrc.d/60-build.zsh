# ─────────────────────────────────────────────
# FILE: 60-build.zsh
# PURPOSE: Compilation helpers & C++ tooling
# ─────────────────────────────────────────────

n++ () {
  g++ "$1" -o "${1%.*}" -std=c++11 -lncurses
}

sdl2++ () {
  g++ "$1" -o "${1%.*}" -std=c++11 \
    -I/opt/homebrew/include/SDL2 \
    -L/opt/homebrew/lib \
    -lSDL2 -lSDL2_image -lSDL2_ttf -lSDL2_mixer -lm
}

# delexe () { find "$1" -type f -executable ! -name "*.*" -delete; }
# delexet () { find "$1" -type f -executable ! -name "*.*" -print; }
