source ~/.aliases
source ~/.functions
source ~/.variables
source ~/dotfiles/conda-auto-env/conda_auto_env.sh
source ~/dotfiles/autoenv/activate.sh

# to go to directory of next question
# Web
# if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
#   __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
#   source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
# fi

# # >>> conda init >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$(CONDA_REPORT_ERRORS=false '$HOME/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     \eval "$__conda_setup"
# else
#     if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
# # . "$HOME/miniconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
#         CONDA_CHANGEPS1=false conda activate base
#     else
#         \export PATH="$HOME/miniconda3/bin:$PATH"
#     fi
# fi
unset __conda_setup
# <<< conda init <<<

source ~/.bash_completion/alacritty

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mgreco/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/mgreco/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/mgreco/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/mgreco/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval $(~/.linuxbrew/bin/brew shellenv)
