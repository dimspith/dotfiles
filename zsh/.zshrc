#===============================
# THIS CONFIG IS USED WITH ZGEN,
# INSTALL IT BEFORE USING IT
#===============================

### ZSH OPTIONS ###

# Load needed modules
autoload -Uz compinit promptinit
compinit
promptinit

bindkey -e

PROMPT='%(?.%F{green}(^ω^.%B%F{red}(>人<)) %B%F{yellow}%n@%m%f%F{blue}%B -> %2~ %f'

# Complete in menu style with root detection
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

setopt ALIASES
setopt COMPLETE_ALIASES
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt AUTO_CD
setopt AUTO_LIST
setopt correct_all

# Colored man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r
#  ______ _  ___ _ __
# |_  / _` |/ _ \ '_ \
#  / / (_| |  __/ | | |
# /___\__, |\___|_| |_|
#     |___/

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# load plugins
if ! zgen saved;
then
  zgen load "zdharma/fast-syntax-highlighting"
  zgen save
fi

#       _ _
#  __ _| (_) __ _ ___  ___  __
# / _` | | |/ _` / __|/ _ \/ __|
#| (_| | | | (_| \__ \  __/\__ \
# \__,_|_|_|\__,_|___/\___||___/
#

FANCY_TXT_FORMAT="toilet -f mono9 --rainbow"
YTDL_MUSIC="youtube-dl --no-playlist --output \"$HOME/Music/Youtube Downloads/%(title)s.%(ext)s\" -x --audio-format mp3"
YTDL_VIDEO="youtube-dl --no-playlist --output \"$HOME/Music/Youtube Downloads/%(title)s.%(ext)s\" -x --format webm"
YTDL_MUSIC_PLAYLIST="youtube-dl --output \"$HOME/Music/Youtube Downloads/%(title)s.%(ext)s\" -x --audio-format mp3"
GET_CLIPBOARD="\$(xclip -o)"

#QOL
alias v="kak"
alias ls="exa --group-directories-first --color always"
alias la="ls -a"
alias lal="la -l"
alias ll="ls -1"
alias rm="rm -I"
alias please="sudo"
alias install="pacman -S"
alias uninstall="pacman -Rsn"
alias mexec="chmod +x"
alias dot="git --git-dir=$HOME/dotfiles --work-tree=$HOME"

# Replace a symlink with the file it's pointing to
removelink() {
  [ -L "$1" ] && cp --remove-destination "$(readlink "$1")" "$1"
}


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
alias youtube="$FANCY_TXT_FORMAT MusicDL;$YTDL_MUSIC $GET_CLIPBOARD"
alias youtubev="$FANCY_TXT_FORMAT VideoDL; $YTDL_VIDEO $GET_CLIPBOARD"
alias youtubepl="$FANCY_TXT_FORMAT VideoDL; $YTDL_MUSIC_PLAYLIST $GET_CLIPBOARD"
alias open="setsid xdg-open"
alias pdf="setsid zathura"
alias repulse="pulseaudio --kill && sleep 2 && pulseaudio --start"
alias gitlog="git log --all --decorate --oneline --graph"
alias bro="bro 2>/dev/null"
alias kbconf="setxkbmap -model pc105 -layout us,gr -option grp:rctrl_toggle ; setxkbmap -option ctrl:nocaps"
alias findfont="fc-list | grep"
alias clip="xclip -selection clipboard"

#Inits
alias itray="stalonetray -c ~/.xmonad/stalonetrayrc &;disown"
alias ipicom="picom --config ~/.xmonad/picom.conf -b"
