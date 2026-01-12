# ============================================================================
# PATH CONFIGURATION
# ============================================================================
export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=$HOME/.npm-global/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/.pyenv/shims:$PATH

# Android SDK
export ANDROID_HOME=/Users/grom/Library/Android/sdk
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/build-tools/27.0.3:$PATH
export PATH=$ANDROID_HOME/emulator:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH

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
# PROJECT PATHS
# ============================================================================
export GROM_PROJECTS_PATH=~/Projects2
export WORKDIR="/Users/grom/workdir"
export SSA="$WORKDIR/ssa"
export DOCKERS_WORKSPACE="$WORKDIR/ssa/docker/stacks/platform-dev"
export VUE="$WORKDIR/ssp-platform-ui"
export DOCKER_THIS_PC_IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
export PATH_TO_DOCKER_JS="$WORKDIR/platform-js/docker-compose.yaml"
export PATH_TO_SSP_JS="$WORKDIR/sspjs/docker-compose.yaml"
export PATH_TO_SSP_PLATFORM_JS="$WORKDIR/ssp-platform-js/docker-compose.yaml"
export DB="$WORKDIR/mysqlDB"
export DBFirstSnapshot="$WORKDIR/mysqlDBSnapshot"
export DBBackup="$WORKDIR/mysqlDBBackup"
export PATH_TO_DUMP_MYSQL="$WORKDIR/dumpmysql"
export PATH_TO_DOCKER_DEMAND_PLATFORM="$WORKDIR/demand-platform-ui/docker-compose.yaml"
export DEMAND_LIBS="$WORKDIR/demand-libs"

# ============================================================================
# ENVIRONMENT VARIABLES
# ============================================================================
export AWS_PROFILE=grom
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export DOCKER_DEFAULT_PLATFORM=linux/amd64
export spotinst_token=TBD

# ============================================================================
# FUNCTIONS
# ============================================================================
function homestead() {
    ( cd $GROM_PROJECTS_PATH/homestead && vagrant $* )
}

function up() {
    homestead up
    homestead ssh
}

function enter() {
    docker exec -it $1 bash
}

# ============================================================================
# ALIASES
# ============================================================================
alias zshconfig="pstorm ~/.zshrc"
alias ohmyzsh="pstorm ~/.oh-my-zsh"
alias linked='npm ls -g --depth=0 --link=true ; npm ls --link'
alias dwrap='tput rmam'
alias wrap='tput smam'

# Docker aliases
alias startEnv="sh $DOCKERS_WORKSPACE/dockerUp.sh --sspjs --as --ssa --ssay --mysql-m1 --ssas --pjs --spjs"
alias stopEnv="cd $DOCKERS_WORKSPACE; sh ./dockerDown.sh"
alias ssa="cd $WORKDIR/ssa"
alias vue="cd $WORKDIR/ssp-platform-ui"

alias startSspPlatformJs="docker-compose --file=$HOME/workdir/ssp-platform-js/docker-compose.yaml up -d --build"
alias stopSspPlatformJs="docker-compose --file=$HOME/workdir/ssp-platform-js/docker-compose.yaml down"
alias platformLogs="docker-compose --file=$HOME/workdir/ssp-platform-js/docker-compose.yaml logs -f ssp-platform-js"
alias platformInternalLogs="tail -f ~/workdir/ssp-platform-js/logs/ssp-platform-js_master_general*.log | bunyan -o short"
alias platformBashSsp="docker-compose --file=$HOME/workdir/ssp-platform-js/docker-compose.yaml exec ssp-platform-js /bin/sh"

alias startPlatform="docker-compose --file=$HOME/workdir/platform-js/docker-compose.yaml up -d --build"
alias stopPlatform="docker-compose --file=$HOME/workdir/platform-js/docker-compose.yaml down"
alias platformLogs2="docker-compose --file=$HOME/workdir/platform-js/docker-compose.yaml logs -f platform-js"
alias platformInternalLogs2="tail -f ~/workdir/platform-js/logs/platform-js_*.log | bunyan -o short"
alias platformBash="docker-compose --file=$HOME/workdir/platform-js/docker-compose.yaml exec platform-js /bin/sh"

alias startSSP='cd ~/workdir/sspjs/; docker-compose up -d'
alias stopSSP='cd ~/workdir/sspjs/; docker-compose down'

alias startEnvPHP="cd ~/workdir/ssa/docker/stacks/platform-dev-remote-sql; sh ./dockerUp.sh --nojs"
alias stopEnvPHP="cd ~/workdir/ssa/docker/stacks/platform-dev-remote-sql; sh ./dockerDown.sh --nojs"

alias startEnvSSP="cd ~/workdir/ssa/docker/stacks/platform-dev-remote-sql; sh ./dockerUp.sh ssp"
alias stopEnvSSP="cd ~/workdir/ssa/docker/stacks/platform-dev-remote-sql; sh ./dockerDown.sh ssp"
alias sspLogs="docker-compose --file=$PATH_TO_SSP_JS logs -f SSP"
alias sspInternalLogs="tail -f ~/workdir/sspjs/logs/*.log | bunyan -o short"
alias sspBash="docker-compose --file=$PATH_TO_SSP_JS exec tag-mediation /bin/sh"

alias redis="docker-compose --file=$DOCKERS_WORKSPACE/docker-compose.yaml exec redis bash"
alias ssp="cd ~/workdir/sspjs"
alias enterApp="docker exec -it appserver-dev bash"
alias spotlist_rv='spotinst-cli -g prod_us-rv -u haproxy -l -y'
alias spotlist_is='spotinst-cli -g prod_us-is -u haproxy -l -y'
alias partnersNoTest='npx grunt --gruntfile $WORKDIR/ssa/build/Gruntfile.js partnersNoTests'

alias awslogin="docker run --rm -it -v ~/.aws:/root/.aws awsaccess:latest onelogin-aws-assume-role --onelogin-subdomain ironsrc --profile default --aws-region us-east-1 --client_id 32533c92659115869907adf94980349216568ea6465952af3bce1aac2bfdb491 --client_secret ee38aecde4afa4978fbb142e5f5f2ee5638d04789230c8f6fdcd8c984603bf9b --onelogin-app-id 432279 --duration 32400 --onelogin-username serhii.hromykin@is.com"

# ============================================================================
# KEY BINDINGS
# ============================================================================
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

# ============================================================================
# SECRETS
# ============================================================================
[ -r ~/.zsh_secrets ] && source ~/.zsh_secrets
