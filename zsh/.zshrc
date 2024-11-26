

export STARSHIP_CONFIG=~/.config/starship/console.toml
# $HOME/.config/macchina/config.toml

echo '\e[5 q'

alias g='git'
alias k='kubectl'
alias ls='ls_with_depth'
alias ls='eza -l --icons --total-size --no-time --tree -L 1'
alias cat='bat'

autoload -U compinit && compinit

# History
# HISTSIZE=5000 # yolo
HISTFILE=~/.zsh_history
# SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# zsh
export ZSH_AUTOSUGGEST_USE_ASYNC=true
source ~/.zsh/plugins/zsh-async/async.plugin.zsh
source ~/.zsh/plugins/zsh-completions/zsh-completions.plugin.zsh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# fzf
export FZF_COMPLETION_TRIGGER="~~" # (default: '**')
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
source /opt/homebrew/opt/fzf/shell/completion.zsh

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# Go
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

alias zsh-debug="zmodload zsh/zprof; time zsh -i -c exit; zprof"

export EZA_CONFIG_DIR=~/.config/eza

export BAT_THEME=tokyonight_night

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/jmandel/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [[ -n $GHOSTTY_RESOURCES_DIR ]]; then
  autoload -Uz -- "$GHOSTTY_RESOURCES_DIR"/shell-integration/zsh/ghostty-integration
  ghostty-integration
  unfunction ghostty-integration
fi

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
eval "$(fzf --zsh)"

