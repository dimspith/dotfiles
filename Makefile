install: install-deps link install-external install-packages

link:
	@echo -e "\e[0;34mLinking dotfiles...\e[m"
	@cd ..
	@ls -d */ | grep -v '^_' | xargs stow

install-deps:
	@sudo pacman -Sq --needed stow 2>/dev/null

install-external:
	@_init/install-external.bash

install-packages:
	@_init/install-packages.bash
