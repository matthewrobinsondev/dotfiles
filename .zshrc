# Use for profiling & debugging
# zmodload zsh/zprof

start_time=$(date +%s%3N)
# Zoxide
eval "$(zoxide init zsh)"

# ZINIT Plugin stuff
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit ice lucid wait'0'
zinit light joshskidmore/zsh-fzf-history-search
# Hotkeys for auto suggest
bindkey '^w' autosuggest-execute
bindkey '^e' autosuggest-accept
bindkey '^u' autosuggest-toggle

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::command-not-found

# Optimize compinit
autoload -Uz compinit
if [[ ! -f ~/.zcompdump || ~/.zcompdump -ot ~/.zshrc ]]; then
  compinit -u
else
  compinit -C
fi

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias sail="vendor/bin/sail"
alias bat="batcat"
alias nvimconf="cd ~/.config/nvim && nvim"
alias ls="eza -a --color=always --long --git --no-filesize --icons=always --no-time"
alias c="clear"
alias lzd='lazydocker'

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun completions
[ -s "/home/matt/.bun/_bun" ] && source "/home/matt/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Go
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Turso
export PATH="/home/matt/.turso:$PATH"


# Asdf (Programming language manager)
. "$HOME/.asdf/asdf.sh"

# Export colours for tmux
export TERM="xterm-256color"

# Start starship prompt
eval "$(starship init zsh)"

# Print start time on prompt
end_time=$(date +%s%3N)
elapsed_time=$((end_time - start_time))
echo "Starship prompt startup time: ${elapsed_time}ms"

# Use for profiling & debugging
# zprof
