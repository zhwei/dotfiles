#关于历史纪录的配置
# number of lines kept in history
export HISTSIZE=10000
# # number of lines saved in the history after logout
export SAVEHIST=10000
# # location of history
export HISTFILE=~/.zhistory
# # append command to history file once executed
setopt INC_APPEND_HISTORY

#Disable core dumps
limit coredumpsize 0
#autocd 
setopt autocd
#Emacs风格键绑定
bindkey -e
#设置DEL键为向后删除
bindkey "\e[3~" delete-char

#以下字符视为单词的一部分
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

#自动补全功能
setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE

autoload -U compinit
compinit

# Completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path .zcache
#zstyle ':completion:*:cd:*' ignore-parents parent pwd

#Completion Options
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

# Path Expansion
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'

zstyle ':completion:*:*:*:default' menu yes select
zstyle ':completion:*:*:default' force-list always

# GNU Colors 需要/etc/DIR_COLORS文件 否则自动补全时候选菜单中的选项不能彩色显示
[ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:processes' command 'ps -au$USER'

# Group matches and Describe
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'

#命令别名
alias cp='cp -i'
alias mv='mv -i'
alias clpyc='rm *.pyc -rf'
alias ll='ls -la'
alias l='ls'
alias grep='grep --color=auto'
alias ee='emacsclient -t'
alias vim='vim -n'
alias gv='gvim'
alias gvim='gvim -n'
alias vi='vim'
alias la="ls -a"
alias cl="clear"
alias pstorm='phpstorm'

#Colordiff
alias diff='colordiff'

#virtualenv
alias ac_env="source env/bin/activate"
alias ac_vir="source ~/config/virtualenv.sh"


# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git django osx)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

#命令粗体
autoload colors
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval _$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval $color='%{$fg[${(L)color}]%}'
    (( count = $count + 1 ))
done
FINISH="%{$terminfo[sgr0]%}"


#漂亮又实用的命令高亮界面
TOKENS_FOLLOWED_BY_COMMANDS=('|' '||' ';' '&' '&&' 'sudo' 'do' 'time' 'strace')
recolor-cmd() {
    region_highlight=()
    colorize=true
    start_pos=0
    for arg in ${(z)BUFFER}; do
        ((start_pos+=${#BUFFER[$start_pos+1,-1]}-${#${BUFFER[$start_pos+1,-1]## #}}))
        ((end_pos=$start_pos+${#arg}))
        if $colorize; then
            colorize=false
            res=$(LC_ALL=C builtin type $arg 2>/dev/null)
            case $res in
                *'reserved word'*)   style="fg=magenta,bold";;
                *'alias for'*)       style="fg=cyan,bold";;
                *'shell builtin'*)   style="fg=yellow,bold";;
                *'shell function'*)  style='fg=green,bold';;
                *"$arg is"*)
                    [[ $arg = 'sudo' ]] && style="fg=red,bold" || style="fg=blue,bold";;
                *)                   style='none,bold';;
            esac
            region_highlight+=("$start_pos $end_pos $style")
        fi
        [[ ${${TOKENS_FOLLOWED_BY_COMMANDS[(r)${arg//|/\|}]}:+yes} = 'yes' ]] && colorize=true
        start_pos=$end_pos
    done
}
check-cmd-self-insert() { zle .self-insert && recolor-cmd }
check-cmd-backward-delete-char() { zle .backward-delete-char && recolor-cmd }
zle -N self-insert check-cmd-self-insert
zle -N backward-delete-char check-cmd-backward-delete-char

#go config
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

alias git-update-summodule='git submodule foreach git pull origin master'

# for hub
eval "$(hub alias -s)"


# For PHP

PHPUnitAuto() {
	relative='./vendor/bin/phpunit'
	if [ -f $relative ];
	then
		echo "Run $relative"
		eval $relative "$@"
	else
		phpunit "$@"
	fi
}
alias phpunit-auto=PHPUnitAuto

alias tinker='php artisan tinker'
alias switch2php70='brew unlink php@7.3 && brew link --force --overwrite php@7.0'
alias switch2php73='brew unlink php@7.0 && brew link --force --overwrite php@7.3'
alias php73='/usr/local/Cellar/php/7.3.6_1/bin/php'
alias php73composer='/usr/local/Cellar/php/7.3.6_1/bin/php /usr/local/bin/composer'
## for phpbrew
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc
export PHPBREW_SET_PROMPT=1
export EDITOR=vim
export PHPBREW_SYSTEM_PHP="/usr/local/bin/php"
export PHPBREW_RC_ENABLE=1
alias pb='phpbrew'
alias phpv='which php && php -v'
pbauto() {
    if [[ -e $PWD/.phpbrewrc ]]; then
        cat $PWD/.phpbrewrc
        source $PWD/.phpbrewrc
    else
        echo "ERROR: .phpbrewrc not found"
    fi;
}

# for bison
export PATH="/usr/local/opt/bison/bin:$PATH"

# 自动重连ssh端口转发
sshPortForward() {
    while true
    do
        echo 'Connecting ...';
        ssh -N -D "$@"
        sleep 1
        date;
        echo 'connect lost, retrying ...';
    done
}
alias ssh-fwd=sshPortForward
alias sshm='python "${HOME}"/dotfiles/scripts/sshm.py'

# For Composer
export PATH="$HOME/.composer/vendor/bin:$PATH"

# For yarn
#export PATH="$PATH:`yarn global bin`"
export PATH="$PATH:/usr/local/bin"

# For npm
export PATH="$PATH:./node_modules/.bin"
alias cnpm="npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"

# For Item2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

iterm2_print_user_vars() {
    iterm2_set_user_var php_version `php -r 'echo phpversion();'`
    iterm2_set_user_var last_exit_code "$?"
}

# For Ngrok
alias ngrok-cn="${HOME}"/dotfiles/bin/ngrok

#proxy
withproxy() {
    https_proxy="http://127.0.0.1:6152" http_proxy="http://127.0.0.1:6152" $@
}

# For pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# 启用 homebrew 阿里云镜像
brew_enable_aliyun() {
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
brew_reset_aliyun() {
    # 重置brew.git:
    cd "$(brew --repo)"
    git remote set-url origin https://github.com/Homebrew/brew.git
    # 重置homebrew-core.git:
    cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
    git remote set-url origin https://github.com/Homebrew/homebrew-core.git
    export HOMEBREW_BOTTLE_DOMAIN=''
}


# For Java
JAVA_HOME=$(/usr/libexec/java_home)

# Add sonar-scanner
export PATH="$HOME/tools/sonar-scanner/bin:$PATH"


# bzip2
export PATH="/usr/local/opt/bzip2/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/bzip2/include"


# acme.sh
. "/Users/zhwei/.acme.sh/acme.sh.env"


# retry function
# https://gist.github.com/sj26/88e1c6584397bb7c13bd11108a579746
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


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/zhwei/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/zhwei/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/zhwei/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/zhwei/google-cloud-sdk/completion.zsh.inc'; fi
