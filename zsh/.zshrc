#===============================
# THIS CONFIG IS USED WITH ZGEN,
# INSTALL IT BEFORE USING IT
#===============================

### ZSH OPTIONS ###

# Load needed modules
zstyle ':completion:*' completer _complete _ignored 
zstyle :compinstall filename '/home/dimitris/.zshrc'

autoload -Uz compinit promptinit add-zsh-hook
compinit
promptinit

# _nicy_prompt() {
#	PROMPT=$("$HOME/.nimble/bin/nicy")
#}
# add-zsh-hook precmd _nicy_prompt

bindkey -e
#bindkey -s '^s' 'f\n'

# ZSH Prompt
NEWLINE=$'\n'
PROMPT="\
%F{red}@%m %F{magenta}:: [ %2~ ]
%F{yellow}==>%f "

# OLD PROMPT
#PROMPT="%B%F{green}[ %2~ ]%F{yellow}%#~>%f%b "

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
    killall -9 "$1" && sleep 0.5 && setsid -f "$1"
}

# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

f()
{
    local LOCATION="$(\
       fd -H -E .cache -E .m2 -E .ipfs -E .ccls-cache |\
       fzy -l 10 -p 'FIND> ')"
    if [ -n "$LOCATION" ] ; then
        if [ -f "$LOCATION" ]; then
            case $LOCATION in
                *.pdf)  setsid -f zathura        "$LOCATION" ;;
                *.epub) setsid -f zathura        "$LOCATION" ;;
                *.org)  setsid -f emacsclient -c "$LOCATION" ;;
                *.jpg)  setsid -f sxiv           "$LOCATION" ;;
                *.png)  setsid -f sxiv           "$LOCATION" ;;
                *.svg)  setsid -f sxiv           "$LOCATION" ;;
                *.gif)  setsid -f sxiv -a        "$LOCATION" ;;
                *.jpeg) setsid -f sxiv           "$LOCATION" ;;
                *.xcf)  setsid -f gimp           "$LOCATION" ;;
                *.mp4)  setsid -f mpv            "$LOCATION" ;;
                *.wav)  setsid -f mpv            "$LOCATION" ;;
                *.mkv)  setsid -f mpv            "$LOCATION" ;;
                *)      nvim           "$LOCATION" ;;
            esac
        elif [ -d "$LOCATION" ]; then
            cd "$LOCATION"
        fi
    fi
}

linkbin()
{
    if [ "$#" -lt 1 ] ; then
        echo -e "Link binaries to \e[1;32m~/.local/bin\e[0m with custom names"
        echo -e "\e[1mUsage:\e[0m \e[4mlinkbin FILE [FILENAME_IN_PATH]\e[0m\n"
        echo -e "\e[1mExample:\e[0m \e[4mlinkbin ~/neovim nvim\e[0m links \e[32m~/.local/bin/nvim\e[0m to \e[32m~/neovim\e[0m"
        echo -e "\e[1mExample:\e[0m \e[4mlinkbin ~/neovim\e[0m links \e[32m~/.local/bin/neovim\e[0m to \e[32m~/neovim\e[0m"
    elif [ "$#" -eq 2 ] && [ -f "$HOME/.local/bin/$2" ] ; then
        echo -e "\e[1;31m'$HOME/.local/bin/$2'\e[0m exists! Choose a different filename."
    elif [ -f "$1" ] ; then
        if [ ! -x "$1" ] ; then
            echo -e "File \e[1;31m'$1'\e[0m is not executable!"
        elif [ "$#" -eq 1 ]; then
            echo -e "Linking \e[1;32m'$1'\e[0m to \e[1;32m'$HOME/.local/bin/$1'\e[0m"
            ln -s "$(realpath $1)" "$HOME/.local/bin/$1"
        elif [ "$#" -eq 2 ]; then
            echo -e "Linking \e[1;32m'$1'\e[0m to \e[1;32m'$HOME/.local/bin/$2'\e[0m"
            ln -s "$(realpath $1)" "$HOME/.local/bin/$2"
        fi
    else
        echo -e "\e[1;31m'$1'\e[0m is not a valid file!"
    fi
}

#       _ _
#  __ _| (_) __ _ ___  ___  ___
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
alias yeet="rm -rf"
alias nirun="nim c -r --hints:off"
alias e='emacsclient -nw -a ""' 
alias emr="emacs --script"
alias emcomp="emacs --batch --eval '(org-babel-load-file \"~/.config/emacs/config.org\")'"

#Inits
alias rlmacs="pkill emacs && emacs --daemon"
alias initmacs="emacs --daemon;setsid emacsclient -c;exit"
alias xeph="Xephyr -br -ac -noreset -screen 1600x900 :5"
alias inxeph="DISPLAY=:5"


# Disable C-s hanging terminal
#if [[ -t 0 && $- = *i* ]]
#then
#    stty -ixon
#fi

eval "$(lua /usr/share/z.lua/z.lua --init zsh)"

