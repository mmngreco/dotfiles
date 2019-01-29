# ALIASES
# =======

# Files and directories
alias mkdir='mkdir -p -v'

# Navigation
alias back='cd $OLDPWD'
alias home='cd ~/'
alias ..="cd .."
alias ...="cd  ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# Editor
alias nano='nano -W -m'
alias edit='nvim'

# Git
# alias gcl='git clone'
# alias gst='git status'
# alias gb='git branch'
# alias gco='git checkout'
# alias gob='git checkout -b'
# alias ga='git add'
# alias gc='git commit'
# alias gl='git pull'
# alias gh='git push'
# alias glom='git pull origin master'
# alias ghom='git push origin master'
# alias gg='git grep'
# alias glg='git log --oneline --decorate --graph'

# Output
alias lcase="tr '[:upper:]' '[:lower:]'"
alias ucase="tr '[:lower:]' '[:upper:]'"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
# System
alias df="df -h"
alias du="du -h"
# CORES='nproc'
# JOBS=$(expr $CORES + 1)
# alias make="make -j$JOBS"

# Files
alias lcf="rename 'y/A-Z/a-z/' "
alias ucf="rename 'y/a-z/A-Z/' "

# Vim
# alias v='vim'
# alias nv='nvim'
alias vim='nvim'
alias vi='nvim'
# Tmux
alias tn='tmux set -g mode-mouse on'
alias tf='tmux set -g mode-mouse off'
alias tmux='tmux -2'

# Grep
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

# Wget
alias wgetncc='wget --no-check-certificate'

# Utils
alias sitecopy='wget -k -K -E -r -l 10 -p -N -F -nH '
alias ytmp3='youtube-dl --extract-audio --audio-format mp3 '
alias pipclean='curl https://gist.githubusercontent.com/mmngreco/afafe8c37498f8185d25b2648c57f73a/raw/pip_clean.py > ~/pipclean.py; python ~/pipclean.py; rm ~/pipclean.py'


# docker
alias datt='docker attach'
alias dcb='docker-compose build'
alias dclogs='docker-compose logs'
alias dcu='docker-compose up'
alias ddiff='docker diff'
alias deb='dexbash'
alias dimg='docker images'
alias dins='docker inspect'
alias dps='docker ps'
alias drm='docker rm'
alias drmi='docker rmi'
alias drun='docker run'
alias dstart='docker start'
alias dstop='docker stop'
# alias dclimg='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
# alias drestartf='docker start $(docker ps -ql) && docker attach $(docker ps -ql)'

# ls variants
alias la='ls -A'
alias l='ls -alFtr'
alias lsd='ls -d .*'
alias ll='ls -alF'
[ -n "$OS_LIN" ] && alias ls='ls --color=auto'
[ -n "$OS_MAC" ] && alias ls='ls -G'

# Various
alias h='history | tail'
alias hg='history | grep'
alias mvi='mv -i'
alias rmi='rm -i'
alias ak='ack-grep'

alias cs='source ../solve -s'
alias cq='source ../solve -q'
alias ca='source ../solve'
# to go to directory of next question
nq() { d=$(basename "$PWD"); nd=$(printf "../ex%02d*/" $((${d:2:2}+1))); cd $nd ; }
# to go to directory of previous question
pq() { d=$(basename "$PWD"); pd=$(printf "../ex%02d*/" $((${d:2:2}-1))); cd $pd ; }
# Web
alias gist='open -a Firefox https://gist.github.com/'
alias firefox='open -a Firefox'

# work
alias sshmet='ssh mgreco@etstea08'
alias sshcom='ssh mgreco@etstea07'

# FUNCTIONS
# =========
# Archives
function extract {
  if [ -z "$1" ]; then
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
    if [ -f $1 ]; then
      case $1 in
        *.tar.bz2)   tar xvjf $1    ;;
        *.tar.gz)    tar xvzf $1    ;;
        *.tar.xz)    tar xvJf $1    ;;
        *.lzma)      unlzma $1      ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar x -ad $1 ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xvf $1     ;;
        *.tbz2)      tar xvjf $1    ;;
        *.tgz)       tar xvzf $1    ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *.xz)        unxz $1        ;;
        *.exe)       cabextract $1  ;;
        *)           echo "extract: '$1' - unknown archive method" ;;
      esac
    else
      echo "$1 - file does not exist"
    fi
  fi
}

function extract_and_remove {
  extract $1
  rm -f $1
}

function abspath() {
    if [ -d "$1" ]; then
        echo "$(cd $1; pwd)"
    elif [ -f "$1" ]; then
        if [[ $1 == */* ]]; then
            echo "$(cd ${1%/*}; pwd)/${1##*/}"
        else
            echo "$(pwd)/$1"
        fi
    fi
}


function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# parse_git_branch() {
#      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
# }
# export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
# export PS1="\u@\h \[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rb=90'

# Setup some colors to use later in interactive shell or scripts
export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[1;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'
alias colorslist="set | egrep 'COLOR_\w*'" # Lists all the colors
parse_git_branch ()
{
	git name-rev HEAD 2> /dev/null | sed 's#HEAD\ \(.*\)# [git:\1]#'
}
parse_svn_branch() {
	parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk -F / '{print " [svn:" $2 "]"}'
}
parse_svn_url() {
	svn info 2>/dev/null | sed -ne 's#^URL: ##p'
}
parse_svn_repository_root() {
	svn info 2>/dev/null | grep -e '^Repository Root:*' | sed -e 's#^Repository Root: *\(.*\)#\1\/#g '
	#svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'
}

# export PS1="\[${COLOR_LIGHT_BLUE}\]\W\[\033[1;36m\]\[${COLOR_GREEN}\]\$(parse_git_branch)\$(parse_svn_branch)\[${COLOR_LIGHT_BLUE}\] $ \[${COLOR_NC}\]"  # Primary prompt with only a path

# if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
#   __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
#   source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
# fi

# ENVIRONMENT
# ===========

# color
export LS_OPTIONS='--color=always'
export GREP_OPTIONS='--color=always'

# CUSTOM
# ======

# .bashrc
alias reloadrc='source ~/.bashrc'
alias editrc='nvim ~/.bashrc'
alias edittmux='nvim ~/.tmux.conf'
alias editvim='nvim ~/.config/nvim/init.vim'
# variableus
# alias powerline='source ~/miniconda3/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh'
# added by Miniconda3 installer
# export PATH="/Users/mmngreco/miniconda3/bin:$PATH"
# . /Users/mmngreco/miniconda3/etc/profile.d/conda.sh
# added by Miniconda3 4.5.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/mgreco/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/mgreco/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/mgreco/miniconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/mgreco/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
source ~/.bash_completion/alacritty
