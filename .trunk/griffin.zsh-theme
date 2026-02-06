# Digital Ocean Natted IP for private nets
NATADDR=0.0.0.0

setopt promptsubst
setopt promptpercent



# crunch theme  colorpreset examples
# esembeh
# wedisagree cool icons and such
# agnoster lots functions
# powerlevel10k

# %m gets computer (host) name

# sed trim whitespace
#sed 's/ *$//'

# if [[ "$OSTYPE" = darwin* ]]; then
#   # macOS's $HOST changes with dhcp, etc. Use ComputerName if possible.
#     /usr/bin/curl -s http://checkip.dyndns.org/ | sed 's/[a-zA-Z<>/ :]//' > ~/.ip-addr
# else
#     hostname -I > ~/.ipaddr
# fi

#use extended color palette if available
if [[ $TERM = *256color* || $TERM = *rxvt* ]]; then
    #echo "$TERM"
    turquoise="%F{81}"
    orange="%F{166}"
    purple="%F{135}"
    hotpink="%F{161}"
    limegreen="%F{118}"
else
    turquoise="$fg[cyan]"
    orange="$fg[yellow]"
    purple="$fg[magenta]"
    hotpink="$fg[red]"
    limegreen="$fg[green]"
fi

red="$fg[red]"
blue="$fg[blue]"
orange_lt="$FG[214]"
gray_dk="$FG[245]"
purple_lt="$FG[099]"
maroon="$FG[132]"
red_dk="$FG[088]"
teal="$FG[006]"
pink="$FG[013]"

turquoise_bg="%K{81}"
orange_bg="%K{166}"
purple_bg="%K{135}"
hotpink_bg="%K{161}"
limegreen_bk="%K{118}"
maroon_bk="%K{132}"

#[130] = red
#[161] = pink?

# More symbols to choose from:
# * ☀ ✹ ☄ ♆ ♀ ♁ ♐ ♇ ♈ ♉ ♚ ♛ ♜ ♝ ♞ ♟ ♠ ♣ ⚢ ⚲ ⚳ ⚴ ⚥ ⚤ ⚦ ⚒ ⚑ ⚐ ♺ ♻ ♼ ☰ ☱ ☲ ☳ ☴ ☵ ☶ ☷
# * ✡ ✔ ✖ ✚ ✱ ✤ ✦ ❤ ➜ ➟ ➼ ✂ ✎ ✐ ⨀ ⨁ ⨂ ⨍ ⨎ ⨏ ⨷ ⩚ ⩛ ⩡ ⩱ ⩲ ⩵  ⩶ ⨠ ✭ ⓣ Ⓞ ⓐ ⑃ ⓤ ⑊ ± ▴ ▾
# * ⬅ ⬆ ⬇ ⬈ ⬉ ⬊ ⬋ ⬒ ⬓ ⬔ ⬕ ⬖ ⬗ ⬘ ⬙ ⬟  ⬤ 〒 ǀ ǁ ǂ ĭ Ť Ŧ  𝝙 ⚡ ♒ ☁ ☂ Ⓓ ⓧ ⑂ ⓡ ⑄ ♥ ♡ ✗ ✓
# * ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩ ⑪ ⑫ ⑬ ⑭ ⑮ ⑯ ⚡
# * ⑰ ⑱ ⑲ ⑳ ⑴ ⑵ ⑶ ⑷ ⑸ ⑹ ⑺ ⑻ ⑼ ⑽ ⑾ ⑿
# * ⒀ ⒁ ⒂ ⒃ ⒄ ⒅ ⒆ ⒇ ⒈ ⒉ ⒊ ⒋ ⒌ ⒍ ⒎ ⒏
# * ⒐ ⒑ ⒒ ⒓ ⒔ ⒕ ⒖ ⒗ ⒘ ⒙ ⒚ ⒛ ⒜ ⒝ ⒞ ⒟
# * ⒠ ⒡ ⒢ ⒣ ⒤ ⒥ ⒦ ⒧ ⒨ ⒩ ⒪ ⒫ ⒬ ⒭ ⒮ ⒯
# * ⒰ ⒱ ⒲ ⒳ ⒴ ⒵ Ⓐ Ⓑ Ⓒ Ⓓ Ⓔ Ⓕ Ⓖ Ⓗ Ⓘ Ⓙ
# * Ⓚ Ⓛ Ⓜ Ⓝ Ⓞ Ⓟ Ⓠ Ⓡ Ⓢ Ⓣ Ⓤ Ⓥ Ⓦ Ⓧ Ⓨ Ⓩ
# * ⓐ ⓑ ⓒ ⓓ ⓔ ⓕ ⓖ ⓗ ⓘ ⓙ ⓚ ⓛ ⓜ ⓝ ⓞ ⓟ
# * ⓠ ⓡ ⓢ ⓣ ⓤ ⓥ ⓦ ⓧ ⓨ ⓩ ⓪ ⓫ ⓬ ⓭ ⓮ ⓯
# * ⓰ ⓱ ⓲ ⓳ ⓴ ⓵ ⓶ ⓷ ⓸ ⓹ ⓺ ⓻ ⓼ ⓽ ⓾ ⓿
# 🍺 🍎 🍏  🐧 🦩 🦚

# Zsh pre-defined
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]✗"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}±"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}▴"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%}▾"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✓"
# ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✚" # ⓐ ⑃
# ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖" # ⓧ ⑂
# ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ♒" # ⓤ ⑊
# ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➜" # ⓡ ⑄
# ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ⚡"  # ⓜ ⑁

Penguin=🐧
Apple=
# Cloud ☁



if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        ICON="$Penguin"
elif [[ "$OSTYPE" == "darwin"* ]]; then
        ICON="$Apple"
elif [[ "$OSTYPE" == "freebsd"* ]]; then
        echo "$Penguin"
else
        echo "Unknown"
fi


# Use hostname only if the ".box-name" file
# doesn't exist.
function box_name {
    if [ -f ~/.box-name ]; then
        cat ~/.box-name
    else
        echo $(hostname)
    fi
}


function get_linux_ip_address {
    str=$(hostname -I)
    array=(${(s/ /)str})
    echo $array[(w)1]
}

function get_mac_ip_addr {
    if [ -f ~/.ip-addr ]; then
        cat ~/.ip-addr
    else
        echo 0.0.0.0
    fi
}

# Print a penguin on a "debian" system
# or print an apple on a "darwin" system
function prompt_char {
    if [ "$ICON" = 🐧 ]; then 
        echo 🐧
    else 
        echo 
    fi
}

# Print darkgray `[` `]` around any value
# $1 color of contents
# $2 actual contents
function brackets() {
	echo "%{$gray_dk%}[%{$1%}$2%{$gray_dk%}]%{$reset_color%}"
}

# Print any color `[` `]` around any value
# $1 color of brackets
# $2 color of contents
# $3 actual contents
function colorbrackets() {
	echo "%{$1%}[%{$2%}$3%{$1%}]%{$reset_color%}"
}

# Print any color `[` `]` around any value with a colored background
# $1 color of brackets
# $2 color of contents
# $3 background color
# $4 contents
function colorbrackets_bg() {
	echo "%{$1%}[%{$reset_color%}%{$3%}$4%{$reset_color%}%{$1%}]%{$reset_color%}"
}

# Color some value
# $1 color
# $2 contents
function colorit(){
	echo "%{$1%}$2%{$reset_color%}"
}

# Vars for each section:
DIR="$(brackets $teal %~)"

#IPADDR="$(colorbrackets_bg $pink $maroon $orange_bg $(ip_addr))"

if [ "$ICON" = 🐧 ]; then 
    IPADDR="$(brackets $maroon $(get_linux_ip_address))"
else 
    IPADDR="$(brackets $maroon $(get_mac_ip_addr))"
fi

NATIP="$(brackets $maroon $NATADDR)"
TIME="$(brackets $pink %T)"
USER="$(brackets $orange_lt %n)"
PROMPT="$(colorit $orange_lt $(prompt_char)) "
GITINFO='$(brackets $limegreen $(git_prompt_info))' # single quotes to delay evaluating
BOXNAME="$(brackets $purple_lt $(box_name))"

# Put components together 
PROMPT="$USER$DIR$GITINFO
$PROMPT"
RPROMPT="$BOXNAME$IPADDR$TIME"
