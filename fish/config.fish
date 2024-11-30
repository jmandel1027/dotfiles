if status is-interactive
    # Commands to run in interactive sessions can go here
end
# Starship configuration
set -x STARSHIP_CONFIG ~/.config/starship/console.toml

# Aliases
alias g='git'
alias k='kubectl'
alias cat='bat'
alias ls='lsd'

# History
# set -U fish_history (mktemp -u ~/.local/share/fish/fish_history)
set -U fish_history_max 100000

# zsh-autosuggestions equivalent in Fish
# Fish has built-in autosuggestions, no need for additional plugins
# fish_config theme save
set -U fish_color_autosuggestion 555 # Change '555' to your preferred color code

# fzf configuration
set -x FZF_COMPLETION_TRIGGER "~~"
set -x FZF_DEFAULT_COMMAND "fd --hidden --strip-cwd-prefix --exclude .git"
set -x FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -x FZF_ALT_C_COMMAND "fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Source fzf key bindings and completion
source /opt/homebrew/opt/fzf/shell/key-bindings.fish

# Go
set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin
set -x GOROOT (brew --prefix golang)/libexec

# PATH
set -x PATH $PATH $GOPATH/bin $GOROOT/bin

# iTerm2 and tmux integration
set -x ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX YES
set -x TMUX_CONF ~/.config/tmux/tmux.conf
alias tmux='tmux -f $TMUX_CONF'

# Bat theme
set -x BAT_THEME tokyonight_night

# lsd config
set -x LSD_CONFIG_FILE ~/.config/lsd/config.yaml

# Rancher Desktop PATH
set -x PATH /Users/jmandel/.rd/bin $PATH

# RVM
# set -x PATH $PATH $HOME/.rvm/bin
# if test -s "$HOME/.rvm/scripts/rvm"
#     source "$HOME/.rvm/scripts/rvm"
# end

# NVM
# set -x NVM_DIR $HOME/.nvm
# if test -s "$NVM_DIR/nvm.sh"
#     source "$NVM_DIR/nvm.sh"
# end
# if test -s "$NVM_DIR/bash_completion"
#     source "$NVM_DIR/bash_completion"
# end

# Ghostty integration
if test -n "$GHOSTTY_RESOURCES_DIR"
    source $GHOSTTY_RESOURCES_DIR/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish
end

# Starship prompt
starship init fish | source

# Carapace initialization
eval (carapace _fish)

# zoxide
eval (zoxide init fish)

# fzf initialization
eval (fzf --fish)
