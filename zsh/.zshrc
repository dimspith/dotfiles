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
PROMPT='%B%F{red}[%2~]%F{yellow}%#>%f%b '

# Complete in menu style with root detection
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

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

# load starship
# eval "$(starship init zsh)"

# load z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

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

# load nix
#load-nix () {
#    . ~/.nix-profile/etc/profile.d/nix.sh
#}

# Search the last 300 commands in history
hist-search() {
    $(history -300 | awk '{$1="";print $0}' | sort | uniq -u | fzy)
}

#=================#
### Keybindings ###
#=================#

# Ctrl-r uses fzy to search history
bindkey -s '^r' '^uhist-search\n'

#       _ _
#  __ _| (_) __ _ ___  ___  __
# / _` | | |/ _` / __|/ _ \/ __|
#| (_| | | | (_| \__ \  __/\__ \
# \__,_|_|_|\__,_|___/\___||___/
#

#QOL
alias v="nvim"
alias ls="exa --group-directories-first --color always --icons"
alias la="ls -a"
alias lal="la -l"
alias lla="la -l"
alias ll="ls -1"
alias rm="rm -I"
alias mexec="chmod +x"
alias j="z"

alias glog="git log --all --decorate --oneline --graph"
alias git_optimize="git reflog expire --all --expire=now; \\
                    git gc --prune=now --aggressive"

alias open="setsid xdg-open"
alias pdf="setsid zathura"
alias grepc="grep --color=auto"
alias grep="grep -i"
alias fzff="fzf -e -i --nth -1 --delimiter='/' --preview='nvim {}'"
alias bfzf="fzf -e -i --prompt='book_search>' --nth -1 --delimiter='/' --color=16" 
alias vf='nvim $(fzff)'

# CONFIGS
alias rlconf="source ~/.zshrc"
alias rlprof="source ~/.zprofile"
alias vzc="nvim $HOME/.zshrc"
alias vrc="nvim $HOME/.config/nvim/init.vim"
alias vpol="nvim $HOME/.config/polybar/config"
alias vi3="nvim $HOME/.config/i3/config"
alias vrf="nvim $HOME/.config/rofi/config"
alias vtm="nvim $HOME/.config/termite/config"
alias val="nvim $HOME/.config/alacritty/alacritty.yml"

# MISCELLANEOUS
alias kbconf="setxkbmap -model pc105 -layout us,gr -option grp:rctrl_toggle ; setxkbmap -option ctrl:nocaps"
alias clip="xclip -selection clipboard"
alias hc="herbstclient"
alias rbackup="rsync -arvP --delete"

#Inits
alias itray="stalonetray -c ~/.xmonad/stalonetray-config/stalonetrayrc &;disown"
alias ipicom="picom --config ~/.xmonad/picom-config/picom.conf -b"
alias rlmacs="pkill emacs && emacs --daemon"
alias initmacs="emacs --daemon;setsid emacsclient -c;exit"
alias xeph="Xephyr -br -ac -noreset -screen 1280x720 :1"
alias inxeph="DISPLAY=:1"
