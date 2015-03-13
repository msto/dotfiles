# .bash_aliases

# Shortcut for ls
alias l='ls -lh --group-directories-first'

# Automate cluster login
function erisone() {
    ping -c 1 erisone.partners.org &> /dev/null
    if [ $? -eq 0 ]; then
        ssh my520@erisone.partners.org
    else
        ssh -t my520@ssh.research.partners.org "ssh -t my520@erisone.partners.org"
    fi
}

export -f erisone
