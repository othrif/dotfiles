# -------
# ZSH
# -------

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# -------
# Aliases
# -------


alias l="ls"
alias o="open ."
alias rm="rm -i"
alias ll="ls -AltFrh"
alias jl="jupyter lab"
alias day='subl ~/Documents/projects/mynotes/mynotes.md'

# -------
# Methods
# -------

adu () {du -sh  "$@" 2>/dev/null | sort -rh}
sshtunnel() {
    if [ "$#" -eq 0 ]; then
        echo "Usage: sshtunnel user@ip port"
    elif [ "$#" -eq 2 ]; then
        ssh -t -L "$2":localhost:"$2" "$1" "export JUPYTER_PORT=$2; exec /bin/bash -l"
    else
        echo "Invalid number of arguments. Usage: sshtunnel user@ip port"
    fi
}


# -------
# PATH
# -------
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"