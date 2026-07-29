all: sync

sync:
	mkdir -p ~/.config/nvim
	mkdir -p ~/.config/rg
	mkdir -p ~/.config/fzf
	mkdir -p ~/.tmux/

	[ -f ~/.gitconfig ] || ln -s $(PWD)/git/.gitconfig ~/.gitconfig
	[ -f ~/.gitignore.global ] || ln -s $(PWD)/git/.gitignore.global ~/.gitignore.global
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux/tmux.conf ~/.tmux.conf
	[ -f ~/.rgignore ] || ln -s $(PWD)/rg/rgignore ~/.rgignore
	[ -f ~/.zshrc ] || ln -s $(PWD)/zsh/zshrc ~/.zshrc
	[ -f ~/.fzf ] || ln -s $(PWD)/fzf/fzf ~/.fzf
	[ -f ~/.config/nvim/init.lua ] || ln -s $(PWD)/nvim/init.lua ~/.config/nvim/init.lua

	# don't show last login message
	touch ~/.hushlogin

clean:
	rm -f ~/.gitconfig
	rm -f ~/.gitignore.global
	rm -f ~/.tmux.conf
	rm -f ~/.rgignore
	rm -f ~/.zshrc
	rm -f ~/.fzf
	rm -f ~/.config/nvim/init.lua

.PHONY: all clean sync
