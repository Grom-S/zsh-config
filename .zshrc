# ============================================================================
# PATH CONFIGURATION
# ============================================================================
export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$HOME/.npm-global/bin:$PATH
export PATH=$HOME/.pyenv/shims:$PATH

# ============================================================================
# OH MY ZSH CONFIGURATION
# ============================================================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# ============================================================================
# NVM CONFIGURATION
# ============================================================================
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Auto-switch Node version based on .nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
  [[ -a .nvmrc ]] || return
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"
 
  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
 
    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Add current npm bin dir to path
export PATH=$(npm bin):$PATH

# ============================================================================
# PNPM CONFIGURATION
# ============================================================================
export PNPM_HOME="/Users/grom/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ============================================================================
# KEY BINDINGS
# ============================================================================
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

# ============================================================================
# SECRETS
# ============================================================================
[ -r ~/Projects/zsh-config/.zsh_secrets ] && source ~/Projects/zsh-config/.zsh_secrets
