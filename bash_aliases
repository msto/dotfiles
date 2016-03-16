

# Syntax highlighting for `less`
function cless() {
    pygmentize -f 256 -O style=solarizedlight -g "$1" | less -R
}

alias tunnel='ssh my520@ssh.research.partners.org'

# Tmux helpers
alias tt='tmux attach -t'
alias tl='tmux ls'
function tn () {
    session=$1

    if [[ "$session" == "-t" ]]; then
        tmux new $@
    elif [[ ! -z "$session" ]]; then
        tmux new -s $session
    else
        tmux new
    fi
}
