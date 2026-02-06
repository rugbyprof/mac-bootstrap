# crunch theme  colorpreset examples
# esembeh
# wedisagree cool icons and such

# Digital Ocean Natted IP for private nets
NATIP=0.0.0.0

#use extended color palette if available
if [[ $TERM = *256color* || $TERM = *rxvt* ]]; then
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


orange_dk="%FG{214}"
gray_dk="%FG{245}"
purple_lt="%FG{099}"
maroon="%FG{132}"
red_dk="%FG{088}"
teal="%FG{006}"
pink="%FG{013}"


# Zsh pre-defined
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="$FG[130]✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}±%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%}▾%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✓%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ♥%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ♡%{$reset_color%}"

# You can set your computer name in the ~/.box-name file if you want.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo ${SHORT_HOST:-$HOST}
}

# Machine name.
function get_box_name {
    if [ -f ~/.box-name ]; then
        cat ~/.box-name
    else
        echo $HOST
    fi
}

# User name.
function get_usr_name {
    local name="%n"
    if [[ "$USER" == 'root' ]]; then
        name="%{$highlight_bg%}%{$white_bold%}$name%{$reset_color%}"
    fi
    echo $name
}

local zeta='⚡'




function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

PROMPT='$gray_dk[%{$reset_color%}$maroon%}$NATIP$gray_dk][%{$reset_color%}%{$reset_color%}$purple_lt%m%{$reset_color%}$gray_dk][%{$reset_color%}$(git_prompt_info)$gray_dk]
$gray_dk[%{$reset_color%}%{$FG[$ORANGE]%}%n$gray_dk]%{$FG[$ORANGE]%}$(prompt_char)%{$reset_color%} '
RPROMPT='$gray_dk[%{$reset_color%}$teal%~%{$reset_color%}$gray_dk][%{$reset_color%}$pink%T%{$reset_color%}$gray_dk]%{$reset_color%}'
