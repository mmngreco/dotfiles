#!/usr/bin/env bash

source ~/.common.sh
source ~/.prompt.sh

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

# always after any prompt changes
[ -f $HOME/.autoenv/activate.sh ] && source $HOME/.autoenv/activate.sh

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/home/mgreco/.local/bin/micromamba";
export MAMBA_ROOT_PREFIX="/home/mgreco/micromamba";
__mamba_setup="$('/home/mgreco/.local/bin/micromamba' shell hook --shell bash --prefix '/home/mgreco/micromamba' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/home/mgreco/micromamba/etc/profile.d/micromamba.sh" ]; then
        . "/home/mgreco/micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="/home/mgreco/micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<

# Prompt
eval "$(starship init bash)"
