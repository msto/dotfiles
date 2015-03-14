# .bash_aliases

# Shortcut for ls
alias l='ls -lh --group-directories-first'

# Automate cluster login
function erisone() {
    ping -c 1 erisone.partners.org &> /dev/null
    if [ $? -eq 0 ]; then
        ssh -X my520@erisone.partners.org
    else
        ssh -tX my520@ssh.research.partners.org "ssh -tX my520@erisone.partners.org"
    fi
}

export -f erisone

alias tunnel='ssh my520@ssh.research.partners.org'
alias anthill='ssh msto@anthill.cs.dartmouth.edu'
