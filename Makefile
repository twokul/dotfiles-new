all: sync

# Guard style: `[ -e X ] || [ -L X ]`.
#   -f is wrong for directory targets, and BOTH -f and -e follow symlinks, so
#   they report false for a *broken* link and `ln` then aborts the whole run.
#   -L tests the link itself, so the pair covers files, directories, and live
#   or dangling symlinks alike.
LINK = [ -e $(1) ] || [ -L $(1) ] || ln -s $(PWD)/$(2) $(1)

sync:
	mkdir -p ~/.config/rg
	mkdir -p ~/.config/ghostty
	mkdir -p ~/.tmux/

	$(call LINK,~/.gitconfig,git/.gitconfig)
	$(call LINK,~/.gitignore.global,git/.gitignore.global)
	$(call LINK,~/.tmux.conf,tmux/tmux.conf)
	$(call LINK,~/.rgignore,rg/rgignore)
	$(call LINK,~/.zshrc,zsh/zshrc)
	$(call LINK,~/.config/ghostty/config,ghostty/config)

	# LazyVim needs the whole tree (lua/config, lua/plugins), so link the
	# directory rather than a single init.lua.
	$(call LINK,~/.config/nvim,nvim)

	# don't show last login message
	touch ~/.hushlogin

clean:
	rm -f ~/.gitconfig
	rm -f ~/.gitignore.global
	rm -f ~/.tmux.conf
	rm -f ~/.rgignore
	rm -f ~/.zshrc
	rm -f ~/.config/ghostty/config
	# only unlink; never recurse into a real config directory
	[ -L ~/.config/nvim ] && rm -f ~/.config/nvim || true

.PHONY: all clean sync
