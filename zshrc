fpath=( ~/dotfiles/zfunc "${fpath[@]}" )
autoload -Uz tn

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# export PS1="[\u@\h \W]\$ "
export PROMPT="[%n@%m %1~]$ "

# Aliases
alias tt="tmux attach -t"
alias tl="tmux ls"
alias l='gls -Flh --group-directories-first'
alias nb='jupyter notebook'
alias fvim='vim $(fzf --height 40% --reverse)'
alias wiki='cd ~/vimwiki; vim $(fzf --height 40% --reverse); cd -'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/matthewstone/.miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/matthewstone/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/matthewstone/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/matthewstone/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

