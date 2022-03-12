# Emacs keybindings (default)
bindkey -e

# Load asdf if it is installed
[[ -f "$HOME/.asdf/asdf.sh" ]] &&
        . $HOME/.asdf/asdf.sh  &&
        fpath=(${ASDF_DIR}/completions $fpath)

# Load zoxide if it is installed
command -v "zoxide" >/dev/null &&
        eval "$(zoxide init zsh)" &&
        alias j="z"

# Run ls every time you change directories
autoload -U add-zsh-hook
add-zsh-hook -Uz chpwd (){ ls --group-directories-first --color=always; }

# Load custom modules
. "$XDG_CONFIG_HOME/zsh/modules/completion.zsh"

# Prompt config
PROMPT='%K{black}%F{red}%(?..(%?%))'\
'%F{green}@%m %F{cyan}[%2~]'\
'%#%f%k%b '

# Tweak history
HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=1000
HISTORY_IGNORE='(hist-search|cd ..|ls|la|l)'
setopt sharehistory
setopt extendedhistory

# Expand aliases
setopt ALIASES

# Prevent aliases from being internally substituted
setopt COMPLETE_ALIASES

# Cursor stays in position when completion is requested
setopt complete_in_word

# Move cursor to the end when completion is done
setopt always_to_end

# Enable usage of directory names as commands without cd
setopt AUTO_CD

# List choices on an ambiguous completion
setopt AUTO_LIST

# Try to correct the spelling of all arguments in a line
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
      *.tar.bz2)   tar xvjf $1   ;;
      *.tar.xz)    tar xvf $1    ;;
      *.tar.gz)    tar xvzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xvf $1    ;;
      *.tbz2)      tar xvjf $1   ;;
      *.tgz)       tar xvzf $1   ;;
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
       fzf --prompt='FIND> ')"
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
alias vrc="nvim $HOME/.config/nvim/init.lua"
alias vpol="nvim $HOME/.config/polybar/config"
alias vi3="nvim $HOME/.config/i3/config"
alias vrf="nvim $HOME/.config/rofi/config.rasi"
alias vtm="nvim $HOME/.config/termite/config"
alias val="nvim $HOME/.config/alacritty/alacritty.yml"

# MISCELLANEOUS
alias kbconf="setxkbmap -model pc105 -layout us,gr -option grp:rctrl_toggle ; setxkbmap -option ctrl:nocaps"
alias clip="xclip -selection clipboard"
alias rbackup="rsync -arvP --delete"
alias yeet="shred -n 3 -vzu"
alias nirun="nim c -r --hints:off"
alias e='emacsclient -nw -a ""' 
alias emr="emacs --script"
alias emcomp="emacs --batch --eval '(org-babel-load-file \"~/.config/emacs/config.org\")'"
alias trm="trash-rm"
alias tem="trash-empty"
alias tpt="trash-put"
alias tlist="trash-list"

#Inits
alias rlmacs="pkill emacs && emacs --daemon"
alias initmacs="emacs --daemon;setsid emacsclient -c;exit"
alias xeph="Xephyr -br -ac -noreset -screen 1600x900 :5"
alias inxeph="DISPLAY=:5"

n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn -de "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

run () { setsid -f "$1" > /dev/null 2>&1 }

#export NVM_DIR="$HOME/.config/nvm"
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#export PATH="$NVM_DIR/versions/node/v$(<$NVM_DIR/alias/default)/bin:$PATH"
#alias nvm="unalias nvm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm $@"
. "/home/dimitris/.local/share/cargo/env"
