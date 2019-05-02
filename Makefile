clean:
	@rm -rf localbcp remotebcp

remotebackup:
	@echo "Making backup of repo's configs..."
	@-rsync -a --exclude .git .[^.]* remotebcp

replace: clean remotebackup
	@echo "Replacing i3 config..."
	@cp -rf ~/.config/i3/config .config/i3/config
	@echo "Replacing zsh config..."
	@cp -rf ~/.zshrc .zshrc
	@echo "Replacing polybar config..."
	@cp -rf ~/.config/polybar/config .config/polybar/config
	@echo "Replacing rofi config..."
	@cp -rf ~/.config/rofi/config .config/rofi/config
	@echo "Replacing tmux config..."
	@cp -rf ~/.tmux.conf .tmux.conf
	@echo "Replacing termite config"
	@cp -rf ~/.config/termite/config .config/termite/config
	@echo "Replacing neovim config..."
	@cp -rf ~/.config/nvim/ .config/
	@echo "Removing neovim plugins..."
	@rm -rf .config/nvim/plugged/*
	@echo "All done!"
