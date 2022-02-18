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

# Clean up home directory
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export SSB_HOME="$XDG_DATA_HOME"/zoom
export NIMBLE_DIR="$XDG_DATA_HOME"/nimble
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config
export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia:$JULIA_DEPOT_PATH"
export GOPATH="$XDG_DATA_HOME/go"

# NNN Plugins
export NNN_PLUG='f:fzopen;j:autojump'

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
export PATH="$HOME/.local/share/cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.luarocks/bin:$PATH"
export PATH="$HOME/.local/share/nimble/bin:$PATH"
export PATH="$HOME/.scripts:$PATH"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# Add GOPATH to PATH
export PATH="$GOPATH/bin:$PATH"

# Dotnet Path
export PATH="$HOME/.dotnet/:$PATH"
export DOTNET_ROOT="$HOME/.dotnet/"

# OpenTabletDriver Binaries
export PATH="$HOME/programs/OpenTabletDriver/bin:$PATH"

# NPM Global path, set with `npm config set prefix '~/.npm-global'`
export PATH=~/.npm-global/bin:$PATH
