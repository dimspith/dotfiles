install: install-deps link install-external install-packages

link:
	@echo "Linking dotfiles..."
	@cd ..
	@ls -d */ | grep -v '^_' | xargs stow

install-deps:
	@sudo pacman -Sq --needed stow 2>/dev/null
