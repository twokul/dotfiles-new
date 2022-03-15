source ./plugins

# Enable zoxide
# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"

# Install useful key bindings and fuzzy completion
# https://github.com/junegunn/fzf
$(brew --prefix)/opt/fzf/install
