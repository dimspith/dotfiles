#===============================
# THIS CONFIG IS USED WITH ZGEN,
# INSTALL IT BEFORE USING IT
#===============================

#          _   _   _                 
# ___  ___| |_| |_(_)_ __   __ _ ___ 
#/ __|/ _ \ __| __| | '_ \ / _` / __|
#\__ \  __/ |_| |_| | | | | (_| \__ \
#|___/\___|\__|\__|_|_| |_|\__, |___/
#                          |___/     

# Haskell ghcup
source $HOME/.ghcup/env

# Autojump plugin configuration
[[ -s /home/dimitris/.autojump/etc/profile.d/autojump.sh ]] && source /home/dimitris/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# Command autocorrection
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Vim Keybindings
bindkey -e

# How ofter to update zsh.
export UPDATE_ZSH_DAYS=13

#  ______ _  ___ _ __
# |_  / _` |/ _ \ '_ \
#  / / (_| |  __/ | | |
# /___\__, |\___|_| |_|
#     |___/

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then

  # Enable oh-my-zsh support and plugins/themes
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/colored-man-pages
  zgen oh-my-zsh themes/gentoo

  # External plugins
  zgen load "zdharma/fast-syntax-highlighting"
  zgen load "MichaelAquilina/zsh-you-should-use"
  zgen load "wting/autojump"

  # save to init script
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
alias v="nvim"
alias la="ls -gGAh"
alias ls="ls --color=always -X --group-directories-first"
alias rm="rm -I"
alias please="sudo"

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

