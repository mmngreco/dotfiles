source ~/.aliases
source ~/.functions

# to go to directory of next question
# Web
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
