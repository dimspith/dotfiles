function univars --description "Set universal variables"
    # GTK and QT settings
    set -Ux QT_QPA_PLATFORMTHEME "qt5ct"
    set -Ux GTK2_RC_FILES "$HOME/.gtkrc-2.0"

    # Default application values
    set -Ux EDITOR "emacsclient -c -nw"
    set -Ux BROWSER "firefox"
    set -Ux TERMINAL "alacritty"
    set -gx PASSWORD_STORE_ENABLE_EXTENSIONS "true"
    set -gx TERM "xterm-256color"

    # Set the default configuration file folder
    set -U XDG_CONFIG_HOME "$HOME/.config"

    #### PATH ####
    # Ruby binaries
    set -U fish_user_paths $HOME/.gem/ruby/2.6.0/bin $fish_user_paths
    # set -gx PATH $HOME/.gem/ruby/2.6.0/bin $PATH
    # Haskell binaries
    set -U fish_user_paths $HOME/.cabal/bin $fish_user_paths
    # set -gx PATH $HOME/.cabal/bin $PATH
    # Rust binaries
    set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
    # set -gx PATH $HOME/.cargo/bin $PATH
    # Local binaries
    set -U fish_user_paths $HOME/.local/bin $fish_user_paths
    # set -gx PATH $HOME/.local/bin $PATH
    # npm
    set -U fish_user_paths $HOME/.npm-global/bin $fish_user_paths
    # set -gx PATH $HOME/.npm-global/bin $PATH
    # go
    set -U fish_user_paths $HOME/MyPrograms/go/bin $fish_user_paths
    # set -gx PATH $HOME/MyPrograms/go/bin $PATH
end
