# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting laravel)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"




####################################################################
# zshell customize <start>
#####################################################################


# theme: pure
## https://github.com/sindresorhus/pure
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure
## colors
zstyle :prompt:pure:path color cyan
zstyle :prompt:pure:prompt:success color cyan
zstyle :prompt:pure:git:branch color yellow
zstyle :prompt:pure:execution_time color black


#####################################################################
# zshell customize <end>
#####################################################################




#####################################################################
# User Configs <start>
#####################################################################

# env
export EDITOR=vim
export LANG=en_GB


# alias
alias diff='colordiff'
alias pstorm='phpstorm'
alias ngrok-cn="${HOME}"/dotfiles/bin/ngrok

## run command with proxy
withproxy() {
    https_proxy="http://127.0.0.1:6152" http_proxy="http://127.0.0.1:6152" $@
}

## retry function
## https://gist.github.com/sj26/88e1c6584397bb7c13bd11108a579746
function retry {
  local retries=$1
  shift

  local count=0
  until "$@"; do
    exit=$?
    # wait=$((2 ** $count)) # wait by retry times
    wait=1
    count=$(($count + 1))
    if [ $count -lt $retries ]; then
      echo ""
      echo "====================================="
      echo "=> Retry $count/$retries exited $exit, retrying in $wait seconds..."
      echo "====================================="
      echo ""
      sleep $wait
    else
      echo ""
      echo "====================================="
      echo "=> Retry $count/$retries exited $exit, no more retries left."
      echo "====================================="
      echo ""
      return $exit
    fi
  done
  return 0
}


# go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"


# hub (github)
eval "$(hub alias -s)"


# php
alias phpv='which php && php -v'
## phpunit
phpunit-auto() {
	relative='./vendor/bin/phpunit'
	if [ -f $relative ];
	then
		echo "Run $relative"
		eval $relative "$@"
	else
		phpunit "$@"
	fi
}
## phpbrew
export PHPBREW_SET_PROMPT=0
export PHPBREW_SYSTEM_PHP="/usr/local/bin/php"
export PHPBREW_RC_ENABLE=1
source ~/.phpbrew/bashrc
alias pb='phpbrew'
pbauto() {
    if [[ -e $PWD/.phpbrewrc ]]; then
        cat $PWD/.phpbrewrc
        source $PWD/.phpbrewrc
    else
        echo "ERROR: .phpbrewrc not found"
    fi;
}
## phpbrew prompt for pure
_prompt_pure_phpbrew_version() {
    if [[ -n "$PHPBREW_PHP" ]]; then
        psvar[12]="$PHPBREW_PHP $psvar[12]"
    fi
}
add-zsh-hook precmd _prompt_pure_phpbrew_version
## composer
export PATH="$HOME/.composer/vendor/bin:$PATH"


# bison
export PATH="/usr/local/opt/bison/bin:$PATH"


# ssh
alias sshm='python "${HOME}"/dotfiles/scripts/sshm.py'
ssh-forward() {
    while true
    do
        echo 'Connecting ...';
        ssh -N -D "$@"
        sleep 1
        date;
        echo 'connect lost, retrying ...';
    done
}


# javascript
## yarn
export PATH="$PATH:/usr/local/bin"
## npm
# export PATH="$PATH:./node_modules/.bin"
alias cnpm="npm --registry=https://registry.npm.taobao.org \
    --cache=$HOME/.npm/.cache/cnpm \
    --disturl=https://npm.taobao.org/dist \
    --userconfig=$HOME/.cnpmrc"


# iTerm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
iterm2_print_user_vars() {
    iterm2_set_user_var php_version `php -r 'echo phpversion();'`
    iterm2_set_user_var last_exit_code "$?"
}


# pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# brew
export PATH="/usr/local/sbin:$PATH"
# brew aliyun mirror
brew_enable_aliyun_mirror() {
    # 替换brew.git:
    cd "$(brew --repo)"
    git remote set-url origin https://mirrors.aliyun.com/homebrew/brew.git
    # 替换homebrew-core.git:
    cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
    git remote set-url origin https://mirrors.aliyun.com/homebrew/homebrew-core.git
    # 应用生效
    brew update
    # 替换homebrew-bottles:
    export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
}
brew_disable_aliyun_mirror() {
    # 重置brew.git:
    cd "$(brew --repo)"
    git remote set-url origin https://github.com/Homebrew/brew.git
    # 重置homebrew-core.git:
    cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
    git remote set-url origin https://github.com/Homebrew/homebrew-core.git
    export HOMEBREW_BOTTLE_DOMAIN=''
}


# java
JAVA_HOME=$(/usr/libexec/java_home)


# bzip2
export PATH="/usr/local/opt/bzip2/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/bzip2/include"


# acme.sh
. "/Users/zhwei/.acme.sh/acme.sh.env"


## gcp
enable_gcp() {
    # The next line updates PATH for the Google Cloud SDK.
    if [ -f '/Users/zhwei/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/zhwei/google-cloud-sdk/path.zsh.inc'; fi
    # The next line enables shell command completion for gcloud.
    if [ -f '/Users/zhwei/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/zhwei/google-cloud-sdk/completion.zsh.inc'; fi
}


# pipenv
enable_pipenv_completion() {
    eval "$(pipenv --completion)"
}


#####################################################################
# User Configs <end>
#####################################################################
