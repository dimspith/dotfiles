#!/bin/bash

echo -e "\e[0;34mChecking if emacs is installed..\e[0m"
if [ -d ~/.emacs.d/ ]; then
    echo -e "\e[0;33mEmacs is already installed!\e[0m"
else
    echo -e "\e[0;32mCloning emacs configuration..\e[0m"
    git clone https://gitlab.com/dimitrissp/emacs-configuration.git ~/.emacs.d/
    cd ~/.emacs.d/
    make

fi

echo -e "\e[0;34mChecking if XMonad is installed..\e[0m"
if [ -d ~/.xmonad/ ]; then
    echo -e "\e[0;33mXMonad is already installed!\e[0m"
else
    echo -e "\e[0;32mCloning XMonad configuration..\e[0m"
    git clone --recurse-submodules https://gitlab.com/dimitrissp/xmonad-configuration.git ~/.xmonad/
    cd ~/.xmonad
    make
fi
