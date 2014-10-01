
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
