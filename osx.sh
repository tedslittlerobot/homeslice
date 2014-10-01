
export HOMESLICE_OS='osx'

# quick look

function ql {
	qlmanage -p "$@" >& /dev/null
}
