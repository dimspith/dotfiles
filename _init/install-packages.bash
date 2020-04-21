#!/bin/bash

###########################
#### INITIAL VARIABLES ####
###########################
PACMAN_PACKAGES=""
AUR_PACKAGES=""
PACKAGE_FILE=$(dirname "$0")/packages.toml

##############################
#### PACKAGE FILE PARSING ####
##############################
PACMAN_PACKAGES=$(pcregrep -M "\[pacman\][\S\s]*?(^\[|\Z)" "$PACKAGE_FILE" | sed 's/^\[.*$//g;/^$/d')
AUR_PACKAGES=$(pcregrep -M "\[yay\][\S\s]*?(^\[|\Z)" "$PACKAGE_FILE" | sed 's/^\[.*$//g;/^$/d')

echo $PACMAN_PACKAGES
echo $AUR_PACKAGES

for i in $PACMAN_PACKAGES
do
    if pacman -Qq "$i" &> /dev/null; then
        echo -e "\e[0;32m $i is installed!\e[0m"
    else
        REPOS_NOT_INSTALLED+=("$i")
        echo -e "\e[0;31m $i is not installed!, Adding to list..\e[0m"
    fi
done

for i in $AUR_PACKAGES
do
    if yay -Qq "$i" &> /dev/null; then
        echo -e "\e[0;32m $i is installed!\e[0m"
    else
        echo -e "\e[0;31m $i is not installed!, Adding to list..\e[0m"
        AUR_NOT_INSTALLED+=("$i")
    fi
done

if [ ! ${#REPOS_NOT_INSTALLED[@]} -eq 0 ] || [ ! ${#AUR_NOT_INSTALLED[@]} -eq 0 ];
then
    INPUT="n"
    while [[ ! $INPUT =~ ^[Yy]$ ]]
    do
        read -r -p "Install missing packages? (y/n/l): " -n 1 INPUT;
        echo
        if [[ $INPUT =~ ^[Nn]$ ]]
        then
            echo -e "\e[31mAborting...\e[0m"; exit 1
        elif [[ $INPUT =~ ^[Ll]$ ]]
        then
            echo "Missing packages:"
            echo -e "\e[34mREPOS:\e[0m"
            echo "\e[36m${REPOS_NOT_INSTALLED[@]}\e[0m"
            echo -e "\e[34mAUR:\e[0m"
            echo "\e[36m${AUR_NOT_INSTALLED[@]}"
        elif [[ $INPUT =~ ^[Yy]$ ]]   
        then
            if sudo pacman -Sq "${REPOS_NOT_INSTALLED[@]}";
            then
                echo -e "\e[30;42m All done! :)\e[0m"
            else
                echo -e "\e[30;41m Installation cancelled.. :(\e[0m"
            fi
        fi
    done
else
    echo "All packages are installed!"
fi

