# Aliases
# ------
# Create a new directory
alias md="mkdir -p"

# Tmux
alias tns="tmux new -s"
alias ta="tmux attach -t"
alias tls="tmux ls"
alias tk="tmux kill-session -t"

# `coreutils` overrides
alias ls="ls -F"
alias l="ls -lAh"
alias ll="ls -l"
alias la="ls -A"

# Jumper
alias z="fasd_cd -d"

# Git
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gco="git checkout"
alias gs="git status -sb"
alias gp="git push origin HEAD"
alias gr="git remote"
alias ga="git add"
alias gpf="git push origin HEAD --force"
alias gd="git diff"
alias gc="git commit -v"
alias gdt="git difftool"
alias gb="git branch"
