

export STARSHIP_CONFIG=~/.config/starship/console.toml
# $HOME/.config/macchina/config.toml

echo '\e[5 q'

alias g=git

autoload -U compinit && compinit

# source ~/.zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
# Homebrew
export GOROOT="$(brew --prefix golang)/libexec"

# Manual install
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

autoload -U compinit; compinit

export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES
export TMUX_CONF=~/.config/tmux/tmux.conf

alias tmux='tmux -f $TMUX_CONF'

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/jmandel/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
