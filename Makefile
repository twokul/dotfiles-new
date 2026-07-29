all: sync

sync:
	mkdir -p ~/.config/rg
	mkdir -p ~/.config/fzf
	mkdir -p ~/.config/ghostty
	mkdir -p ~/.tmux/

	[ -f ~/.gitconfig ] || ln -s $(PWD)/git/.gitconfig ~/.gitconfig
	[ -f ~/.gitignore.global ] || ln -s $(PWD)/git/.gitignore.global ~/.gitignore.global
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux/tmux.conf ~/.tmux.conf
	[ -f ~/.rgignore ] || ln -s $(PWD)/rg/rgignore ~/.rgignore
	[ -f ~/.zshrc ] || ln -s $(PWD)/zsh/zshrc ~/.zshrc
	[ -f ~/.fzf ] || ln -s $(PWD)/fzf/fzf ~/.fzf
	[ -f ~/.config/ghostty/config ] || ln -s $(PWD)/ghostty/config ~/.config/ghostty/config

	# LazyVim needs the whole tree (lua/config, lua/plugins), so link the
	# directory rather than a single init.lua.
	[ -e ~/.config/nvim ] || ln -s $(PWD)/nvim ~/.config/nvim

	# don't show last login message
	touch ~/.hushlogin

clean:
	rm -f ~/.gitconfig
	rm -f ~/.gitignore.global
	rm -f ~/.tmux.conf
	rm -f ~/.rgignore
	rm -f ~/.zshrc
	rm -f ~/.fzf
	rm -f ~/.config/ghostty/config
	# only unlink; never recurse into a real config directory
	[ -L ~/.config/nvim ] && rm -f ~/.config/nvim || true

.PHONY: all clean sync
