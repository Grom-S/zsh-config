# ============================================================================
# PATH CONFIGURATION
# ============================================================================
export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$HOME/.npm-global/bin:$PATH
export PATH=$HOME/.pyenv/shims:$PATH
export PATH=$HOME/.local/bin:$PATH

# ============================================================================
# OH MY ZSH CONFIGURATION
# ============================================================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
  git
  docker
  docker-compose
)
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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/grom/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/grom/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/grom/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/grom/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"

devenv() {
  case "$1" in
    cd)
      local __devenv_dir
      __devenv_dir="$(command devenv path "${2:-}")" || return $?
      cd "$__devenv_dir"
      ;;
    *) command devenv "$@" ;;
  esac
}

# export CLAUDE_CODE_USE_BEDROCK=1
# export AWS_REGION=us-east-1

# Disable Fallow Claude code hook
# FALLOW_POSTCOMMIT_ENABLED=0
export HARNESS_REQUIRED_TOOLS=fallow,jq


export PW_TEST_CONNECT_WS_ENDPOINT="$DEVENV_BROWSER_WS"

# Aliases
alias hs=harness
alias dt='code /Users/grom/code/grom/devtools.code-workspace'
