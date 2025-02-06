# Starship configuration
set -x STARSHIP_CONFIG ~/.config/starship/console.toml

# Aliases
alias g='git'
alias k='kubectl'
alias cat='bat'
alias ls='lsd'

alias df='df -h'
alias ducks='du -cksh * | sort -rh|head -11' # Lists folders and files sizes in the current folder
alias f='find . -iname'
alias gr='grep -r' # Recursive grep
alias m='less'
alias systail='tail -f /var/log/system.log'
alias top='top -o cpu'
# Shows most used commands, from: http://lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
alias profileme="history | awk '{print \$4}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

alias hermi="hermit init"
alias herma=". bin/activate-hermit.fish"
alias hermd="deactivate-hermit"

# zsh-autosuggestions equivalent in Fish
# Fish has built-in autosuggestions, no need for additional plugins
# fish_config theme save
set -U fish_color_autosuggestion 555
set -U fish_history 50000

# Git config
set -x GIT_CONFIG ~/.config/git/.gitconfig

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

# tmux integration
set -x TMUX_CONF ~/.config/tmux/tmux.conf
alias tmux='tmux -f $TMUX_CONF'

# Bat theme
set -x BAT_THEME tokyonight_night

# lsd config
set -x LSD_CONFIG_FILE ~/.config/lsd/config.yaml

# Rancher Desktop PATH
set -x PATH /Users/jmandel/.rd/bin $PATH

# Ghostty integration
if test -n "$GHOSTTY_RESOURCES_DIR"
    source $GHOSTTY_RESOURCES_DIR/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish
end

source ~/.private.fish

# Starship prompt
starship init fish | source

# zoxide
eval (zoxide init fish)

# fzf initialization
eval (fzf --fish)
