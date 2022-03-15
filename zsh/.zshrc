export DOTFILES="$HOME/.dotfiles"

# Global Variables
source $DOTFILES/zsh/global-variables.zsh

# Aliases
source $DOTFILES/zsh/aliases.zsh

# ZI Shell
source $DOTFILES/zsh/zi.zsh

# Setup Hub
# use https://github.com/github/hub as `git`
eval "$(hub alias -s)"

# Enable zoxide
# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"

# Install useful key bindings and fuzzy completion
# https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
