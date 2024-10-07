# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.

export ZSH="$HOME/.config/zsh"
export SHELL=/bin/zsh

tmux source ~/.config/tmux/.tmux.conf
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gnzh"

export HISTFILE=~/.config/zsh/user/history
export HISTSIZE=100000
export SAVEHIST=100000
export REPORTTIME=30
setopt autocd extendedglob correct nohup share_history hist_ignore_all_dups hist_ignore_space
# Add wisely, as too many plugins slow down shell startup.

plugins=(git per-directory-history zsh-syntax-highlighting)


source $ZSH/oh-my-zsh.sh
source ~/.config/zsh/user/alias

# User configuration

fzf-history-widget() {
    local selected
    # Read directly from the history file and format the output
    selected=$(cat ~/.config/zsh/user/history | sed 's/^.*;//' | fzf --tac +s --tiebreak=index --exact --query "$LBUFFER" | sed 's/^ *//')

    if [[ -n $selected ]]; then
        # Insert the selected command into the command line (but don't execute)
        LBUFFER=$selected
    fi
    zle redisplay
}

zle -N fzf-history-widget
bindkey '^r' 'fzf-history-widget'
