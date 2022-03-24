# Start keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
eval $(ssh-agent)
exec dbus-launch --sh-syntax --exit-with-session awesome
