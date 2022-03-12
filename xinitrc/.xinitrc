eval $(gnome-keyring-daemon --start)
eval $(ssh-agent)
export SSH_AUTH_SOCK
exec startdwm
