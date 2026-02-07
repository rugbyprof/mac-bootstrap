# ─────────────────────────────────────────────
# FILE: 20-aliases.zsh
# PURPOSE: General aliases & small helpers
# Should never export env vars or do heavy logic
# ─────────────────────────────────────────────

alias cp='cp -i'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ll='ls -FGlAhp'
alias la='ls -lah'
alias less='less -FSRXc'
alias c='clear'

# Navigation helpers
alias ..='cd ../'
alias ...='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias cd..='cd ../'
alias ~='cd ~'

# Quality-of-life
alias edit='code'
alias f='open -a Finder ./'
alias path='echo -e ${PATH//:/\\n}'
alias fix_stty='stty sane'
alias DT='tee ~/Desktop/terminalOut.txt'
alias qfind='find . -name'
alias numFiles='ls -1 | wc -l'

# mkfile helpers (macOS-specific but safe)
alias make1mb='mkfile 1m ./1MB.dat'
alias make5mb='mkfile 5m ./5MB.dat'
alias make10mb='mkfile 10m ./10MB.dat'

# Quick Look
ql () { qlmanage -p "$*" >/dev/null 2>&1; }

# Trash instead of rm
trash () { command mv "$@" ~/.Trash ; }

# mkdir + cd
mcd () { mkdir -p "$1" && cd "$1"; }

# Large file finder
largefiles () {
  find "$1" -type f -size +"$2""$3" -exec ls -lh {} \; \
  | awk '{ print $5 " :\t"  $9 }'
}
