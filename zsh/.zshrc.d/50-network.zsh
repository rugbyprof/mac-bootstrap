# ─────────────────────────────────────────────
# FILE: 50-network.zsh
# PURPOSE: SSH, networking, and system inspection
# ─────────────────────────────────────────────

# SSH shortcuts
alias turing='ssh griffin@turing.msutexas.edu'
alias cs='ssh griffin@cs.msutexas.edu'
alias cs2='ssh griffin@cs2.msutexas.edu'
alias missile='ssh athena@missilecommand.live'
alias battleship='ssh root@battleshipgame.fun'
alias crappy2d='ssh root@crappy2d.us'

# Networking
alias netCons='lsof -i'
alias flushDNS='dscacheutil -flushcache'
alias lsock='sudo lsof -i -P'
alias lsockU='sudo lsof -nP | grep UDP'
alias lsockT='sudo lsof -nP | grep TCP'
alias openPorts='sudo lsof -i | grep LISTEN'

# System usage
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

# Host info
ii() {
  uname -a
  w -h
  date
  uptime
  scselect
  curl -s ifconfig.me
}
