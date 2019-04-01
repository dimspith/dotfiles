clean:
	rm -rf localbcp remotebcp

localbackup:
	rm -rf localbcp
	mkdir localbcp
	cp -rf ~/.config/i3/config localbcp/i3cfg
	cp -rf ~/.zshrc localbcp/zshrc
	cp -rf ~/.config/polybar/config localbcp/polybarcfg
	cp -rf ~/.config/nvim/ localbcp/

remotebackup:
	rm -rf remotebcp
	mkdir remotebcp
	cp -rf .config/i3/config remotebcp/i3cfg
	cp -rf .zshrc remotebcp/zshrc
	cp -rf .config/polybar/config remotebcp/polybarcfg
	cp -rf .config/nvim/ remotebcp/

replace: remotebackup
	cp -rf ~/.config/i3/config .config/i3/config
	cp -rf ~/.zshrc .zshrc
	cp -rf ~/.config/polybar/config .config/polybar/config
	cp -rf ~/.config/nvim/ .config/
	rm -rf .config/nvim/plugged/*

install: localbackup
	cp -rf .config/i3/config ~/.config/i3/config
	cp -rf .zshrc ~/.zshrc
	cp -rf .config/polybar/config  ~/.config/polybar/config
	cp -rf .config/nvim/ ~/.config/


