#Update Path Variable
export PATH="$PATH:$HOME/.local/bin"
ZSH_PLUGIN=$HOME/zsh_plugin

# Initialization
autoload -U compinit; compinit

# Load Plugins
source $ZSH_PLUGIN/fast-syntax-highlighting/F-Sy-H.plugin.zsh
source $ZSH_PLUGIN/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_PLUGIN/zsh-completions/zsh-completions.plugin.zsh

# Setup zshrc
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE


setopt SHARE_HISTORY             # Share history between all sessions.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt HIST_REDUCE_BLANKS        # remove superfluous blanks from history items
setopt AUTO_CD                   # cd by typing directory name if it's not a command
setopt CORRECT_ALL               # autocorrect commands
setopt AUTO_LIST                 # automatically list choices on ambiguous completion
setopt AUTO_MENU                 # automatically use menu completion
setopt ALWAYS_TO_END             # move cursor to end if word had one match

# Caching the queries
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$ZSH_PLUGIN/.zcompcache"
# Define the completers to use (the completer system will try each in the order they are defined)
zstyle ':completion:*' completer _expand _complete _correct _approximate
# Add descriptive hints to completion options
zstyle ':completion:*' auto-description 'specify: %d'
# Enables menu selection, allowing to scroll through options with arrow keys
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
# Enables completion for command options (offers suggestions for options relevant to the command being typed)
zstyle ':completion:*' complete-options true
# Makes completion more forgiving and flexible (case-insensitive etc.)
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# Sorts files in completion suggestions based on their modification times
zstyle ':completion:*' file-sort modification
# Customizes the order of directory suggestions when using the 'cd' command
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
# Retains the prefix typed by the user in the completion suggestions
zstyle ':completion:*' keep-prefix true
# Better SSH/Rsync/SCP Autocomplete
zstyle ':completion:*:(ssh|scp|ftp|sftp):*' hosts $hosts
# Customizes the prompt shown when the list of completions is truncated.
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# Customizes colors for different types of completion descriptions and warnings
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'

# Alias
alias ls="ls -lAhg --color=auto | column -t"

# Program Initialization
if [[ -o interactive ]]; then
    fastfetch
fi

eval "$(starship init zsh)"
