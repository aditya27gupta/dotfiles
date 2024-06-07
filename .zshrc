# Options
setopt auto_list
setopt auto_menu
unsetopt menu_complete
setopt auto_param_slash
setopt append_history
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt inc_append_history
setopt share_history

# HISTORY Options
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Keybinds
alias ll='ls -lah --color=always --group-directories-first'
alias ls='ls --color=always --group-directories-first'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/device/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/device/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/device/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/device/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Start Starship prompt
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

