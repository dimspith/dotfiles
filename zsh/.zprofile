# Use qt5ct/kvantum for themes
export QT_STYLE_OVERRIDE=kvantum

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# Default application values
export EDITOR="nvim"
export BROWSER="firefox"
export VIDEO="mpv"
export IMAGE=""

# Fix terminal detection for certain emulators
export TERM=xterm-256color

# Set the base directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS="/usr/local/share:/usr/share:$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share"

# Disable "less" history
export LESSHISTFILE=-

# Set bat as a manpager
if [ -n "$(which bat)" ]; then
    export MANPAGER="bat -p"
fi

# Fix Java apps misbehaving on certain wms
export _JAVA_AWT_WM_NONREPARENTING=1

# Add paths for programming languages/scripts
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.luarocks/bin:$PATH"
export PATH="$HOME/.nimble/bin:$PATH"
export PATH="$HOME/.scripts:$PATH"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
