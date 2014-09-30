
source vagrant.sh
source php.sh

# git aliases

alias gitbattle='git shortlog -s -n'

# transfer file

function transfer {
  curl --upload-file ./$1 https://transfer.sh/$1 | pbcopy
}

# mkdir -p, then cd into it

function mkcd {
  test -z $1 && echo "You must specify a folder to create, idiot" >&2 && return
  mkdir -p $1
  cd $1
}

# show your top git commands

function topcmd {
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}


alias sthost='st /etc/hosts'
alias stz='st ~/.zshrc'
alias gtt='gittower .'
alias stg='stt && gittower .'

alias hn='hostname | pbcopy'
alias key='cat ~/.ssh/id_rsa.pub | pbcopy'

# servers file

if [ -f ~/.servers ]; then
    source ~/.servers
fi
