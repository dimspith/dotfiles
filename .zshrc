#### ZPLUG ####
source ~/.zplug/init.zsh

# Plugins
zplug "zsh-users/zsh-syntax-highlighting"
zplug "themes/gentoo", from:oh-my-zsh, as:theme
zplug load

#### ZSH Options ####
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' completer _complete #_approximate         # Aproximate autocompletion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 

#### VARIABLES ####
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=500
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word
FANCY_TXT_FORMAT="toilet -f mono9 --rainbow"
YTDL_MUSIC="youtube-dl --no-playlist --output \"$HOME/Music/Youtube Downloads/%(title)s.%(ext)s\" -x --audio-format mp3"
YTDL_VIDEO="youtube-dl --no-playlist --output \"$HOME/Music/Youtube Downloads/%(title)s.%(ext)s\" -x --format webm"
YTDL_MUSIC_PLAYLIST="youtube-dl --output \"$HOME/Music/Youtube Downloads/%(title)s.%(ext)s\" -x --audio-format mp3"
GET_CLIPBOARD="\"\$(xclip -o)\""

#### Keybindings ####
bindkey -e

#### Aliases #### 
#QOL
alias cp="cp -i"
alias df='df -h'
alias free='free -m'
alias kbconf="setxkbmap -model pc105 -layout us,gr -option grp:rctrl_toggle -option ctrl:nocaps" 
alias v="nvim"
alias la="ls -gGAh"
alias ls="ls --color=always -X --group-directories-first"
alias rm="rm -I"
alias please="sudo"
alias ...="cd ../../../"
alias ....="cd ../../../../"

# CONFIGS
alias rlconf="source ~/.zshrc"
alias rlprof="source ~/.profile"
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
alias findfont="fc-list | grep"
alias clip="xclip -selection clipboard"

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r
