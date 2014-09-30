
export HOMESLICE_DIR=${HOMESLICE_DIR:-~/.homeslice}

function upslice {
	pushd ${HOMESLICE_DIR} > /dev/null
	git pull
	popd > /dev/null
}

source ${HOMESLICE_DIR}/vagrant.sh
source ${HOMESLICE_DIR}/php.sh

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

# show @todo tags in the project dir

# function todolist {
	# grep -rn "@todo" . | awk -F ":" '$$1 != "./Makefile" {print $$3; print $$1 $$2  }'
# }


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
