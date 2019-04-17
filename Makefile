clean:
	@rm -rf localbcp remotebcp

localbackup:
	@echo "Making backup of user configs..."
	@-mkdir localbcp
	@-cp -rf ~/.config/i3/ localbcp/
	@-cp -rf ~/.zshrc localbcp/
	@-cp -rf ~/.config/polybar/ localbcp/
	@-cp -rf ~/.config/nvim/ localbcp/
	@-cp -rf ~/.config/rofi/ localbcp/
	@-cp -rf ~/.tmux.conf localbcp/

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
	@echo "Replacing neovim config..."
	@cp -rf ~/.config/nvim/ .config/
	@echo "Removing neovim plugins..."
	@rm -rf .config/nvim/plugged/*
	@echo "All done!"

install: clean localbackup
	echo "Installing configuration files..."
	@cp -rf .config/i3/config ~/.config/i3/config
	@cp -rf .zshrc ~/.zshrc
	@cp -rf .config/polybar/config  ~/.config/polybar/config
	@cp -rf .config/nvim/ ~/.config/
	@cp -rf .tmux.conf ~/.tmux.conf


