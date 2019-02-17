#===================

# THIS CONFIG IS USED WITH OH-MY-ZSH,
# INSTALL IT BEFORE USING IT

#===================

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Home directory script path. 
export PATH=$PATH:$ΗΟΜΕ/bin/

# The theme that zsh is using.
ZSH_THEME="nebirhos"

# The list of plugins to load.
plugins=(git)

# Source file.
source $ZSH/oh-my-zsh.sh

# Aliases.
alias vzc="vim $HOME/.zshrc"
alias la="ls -gGAh"
alias rlconf="source ~/.zshrc"
alias vrc="vim $HOME/.vimrc"
alias vi3="vim $HOME/.config/i3/config"
alias vrf="vim $HOME/.config/rofi/config"
alias youtube="toilet -f mono9 --rainbow Youtube;youtube-dl --output \"$HOME/Music/Youtube Downloads/%(title)s.%(ext)s\" -x --audio-format mp3 \$(clipit -c)"
alias vpol="vim $HOME/.config/polybar/config"
alias rm="rm -I"


# How ofter to update zsh.
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

