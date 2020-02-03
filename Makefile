install:
	@echo -e "\e[0;34mLinking dotfiles...\e[m"
	@ls -d */ | xargs stow
