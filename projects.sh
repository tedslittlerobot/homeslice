
function notes {
	test -z $1 && echo "Specify a folder to test" >&2 && return

	notes-todo-important "$1"
	notes-todo "$1"
	notes-bug "$1"
	notes-hack "$1"
	notes-test "$1"
	notes-optimise "$1"
}

function notes-todo-important {
	test -z $1 && echo "Specify a folder to test" >&2 && return

	echo
	echo '\033[7;4m\033[1;36m@TODO\033[0m\033[0m'

	grep '\(\@TODO.*$\)' -rno $1 | awk -F: '{printf "\033[1;34m%s\033[0m \033[0;37m(\033[0m\033[0;31m%s\033[0m:\033[0;33m%s\033[0m\033[0;37m)\033[0m\n", $3, $1, $2}'
}

function notes-todo {
	test -z $1 && echo "Specify a folder to test" >&2 && return

	echo
	echo '\033[7;4m\033[1;36m@todo\033[0m\033[0m'

	grep '\(\@todo.*$\)' -rno $1 | awk -F: '{printf "\033[1;34m%s\033[0m \033[0;37m(\033[0m\033[0;31m%s\033[0m:\033[0;33m%s\033[0m\033[0;37m)\033[0m\n", $3, $1, $2}'
}

function notes-bug {
	test -z $1 && echo "Specify a folder to test" >&2 && return

	echo
	echo '\033[7;4m\033[1;36m@bug\033[0m\033[0m'

	grep '\(\@bug.*$\)' -rino $1 | awk -F: '{printf "\033[1;34m%s\033[0m \033[0;37m(\033[0m\033[0;31m%s\033[0m:\033[0;33m%s\033[0m\033[0;37m)\033[0m\n", $3, $1, $2}'
}

function notes-hack {
	test -z $1 && echo "Specify a folder to test" >&2 && return

	echo
	echo '\033[7;4m\033[1;36m@hack\033[0m\033[0m'

	grep '\(\@hack.*$\)' -rino $1 | awk -F: '{printf "\033[1;34m%s\033[0m \033[0;37m(\033[0m\033[0;31m%s\033[0m:\033[0;33m%s\033[0m\033[0;37m)\033[0m\n", $3, $1, $2}'
}

function notes-test {
	test -z $1 && echo "Specify a folder to test" >&2 && return

	echo
	echo '\033[7;4m\033[1;36m@test\033[0m\033[0m'

	grep '\(\@test.*$\)' -rino $1 | awk -F: '{printf "\033[1;34m%s\033[0m \033[0;37m(\033[0m\033[0;31m%s\033[0m:\033[0;33m%s\033[0m\033[0;37m)\033[0m\n", $3, $1, $2}'
}

function notes-optimise {
	test -z $1 && echo "Specify a folder to test" >&2 && return

	echo
	echo '\033[7;4m\033[1;36m@optimise\033[0m\033[0m'

	grep '\(\@optimi[sz]e.*$\)' -rino $1 | awk -F: '{printf "\033[1;34m%s\033[0m \033[0;37m(\033[0m\033[0;31m%s\033[0m:\033[0;33m%s\033[0m\033[0;37m)\033[0m\n", $3, $1, $2}'
}

command -v bundle >/dev/null 2>&1 && {
    function cap() {
        bundle exec cap $*
    }

    alias csd="cap staging deploy"
    alias cse="cap staging ec2:status"
    alias cpd="cap production deploy"
    alias cpe="cap production ec2:status"

    function cpssh {
    	ssh deploy@`cpe | tail -n 1 | awk '{ print $5 }'`
    }

    function csssh {
    	ssh deploy@`cse | tail -n 1 | awk '{ print $5 }'`
    }
}
