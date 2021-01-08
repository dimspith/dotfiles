#===============================
# THIS CONFIG IS USED WITH ZGEN,
# INSTALL IT BEFORE USING IT
#===============================

### ZSH OPTIONS ###

# Load needed modules
zstyle ':completion:*' completer _complete _ignored 
zstyle :compinstall filename '/home/dimitris/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

bindkey -e

# ZSH Prompt
PROMPT='%B%F{green}[ %2~ ]%F{yellow}%#~>%f%b '

# Complete in menu style with root detection
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

# Look for matches on the left side of words
zstyle ':completion:*' matcher-list 'l:|=* r:|=*' 

# Tweak history
HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=1000
HISTORY_IGNORE='(hist-search|cd ..|ls|la|l)'
setopt sharehistory
setopt extendedhistory

# load modules
setopt ALIASES
setopt COMPLETE_ALIASES
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt AUTO_CD
setopt AUTO_LIST
setopt correct_all

#===============#
### FUNCTIONS ###
#===============#

# Replace a symlink with the file it's pointing to
removelink() {
    f  [ -L "$1" ] && cp --remove-destination "$(readlink "$1")" "$1"
}

# Find a font using fc-list
findfont() {
    fc-list | grep --color=never "$1" | awk -F "/" '{print $NF}'
}

# Get cheatsheet for a command
cheat() {
   curl cht.sh/$1
}

# Find desktop files
fdesk() {
   fd $1 /usr/share/applications ~/.local/share/applications/
}

# Display covid-19 info
covid() {
    curl https://corona-stats.online/"$1"'?top=30&source=2&minimal=true'
}

# Restart a process by name 
restart() {
    killall -9 "$1" && sleep 1 && setsid -f "$1"
}

# Johny Decimal function
cjd() {
    pushd /mnt/pcdata/Files/*/*/${1}*
}

j() {
    if [ "$1" ]
    then
        DIR="$(fd -H --type directory $1)"
        if [ "$DIR" ]
        then
            cd "$(echo $DIR | fzy -p "DIR: " -l 20)" || return
        else
            echo "Directory not found!"
        fi
    else
        cd "$(fd -H --type directory | fzy -p "DIR: " -l 20)" || return
    fi
}

#       _ _
#  __ _| (_) __ _ ___  ___  __
# / _` | | |/ _` / __|/ _ \/ __|
#| (_| | | | (_| \__ \  __/\__ \
# \__,_|_|_|\__,_|___/\___||___/
#

#QOL
alias v="nvim"
alias ls="exa --group-directories-first --color always"
alias la="ls -a"
alias lal="la -l"
alias lla="la -l"
alias ll="ls -1"
alias rm="rm -I"
alias mexec="chmod +x"

alias glog="git log --all --decorate --oneline --graph"
alias git_optimize="git reflog expire --all --expire=now; \\
                    git gc --prune=now --aggressive"
alias gs="git status"
alias gcm="git commit -m"
alias fuck="sudo \$(history -1 | awk '{\$1=\"\"}1')"

alias open="setsid xdg-open"
alias pdf="setsid zathura"
alias grepc="grep --color=auto"
alias grep="grep -i"
alias fzff="fzf -e -i --nth -1 --delimiter='/' --preview='bat {}'"
alias bfzf="fzf -e -i --prompt='book_search>' --nth -1 --delimiter='/' --color=16" 
alias vf='nvim $(fzff)'

# CONFIGS
alias rlconf="source ~/.zshrc"
alias rlprof="source ~/.zprofile"
alias vzc="nvim $HOME/.zshrc"
alias vrc="nvim $HOME/.config/nvim/init.vim"
alias vpol="nvim $HOME/.config/polybar/config"
alias vi3="nvim $HOME/.config/i3/config"
alias vrf="nvim $HOME/.config/rofi/config.rasi"
alias vtm="nvim $HOME/.config/termite/config"
alias val="nvim $HOME/.config/alacritty/alacritty.yml"

# MISCELLANEOUS
alias kbconf="setxkbmap -model pc105 -layout us,gr -option grp:rctrl_toggle ; setxkbmap -option ctrl:nocaps"
alias clip="xclip -selection clipboard"
alias hc="herbstclient"
alias rbackup="rsync -arvP --delete"
alias yeet="rm -rf "
alias nirun="nim c -r --hints:off"

#Inits
alias itray="stalonetray -c ~/.xmonad/stalonetray-config/stalonetrayrc &;disown"
alias ipicom="picom --config ~/.xmonad/picom-config/picom.conf -b"
alias rlmacs="pkill emacs && emacs --daemon"
alias initmacs="emacs --daemon;setsid emacsclient -c;exit"
alias xeph="Xephyr -br -ac -noreset -screen 1280x720 :1"
alias inxeph="DISPLAY=:1"

