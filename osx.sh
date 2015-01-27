
export HOMESLICE_OS='osx'

# quick look

function ql {
	qlmanage -p "$@" >& /dev/null
}

alias gtt='gittower .'
alias stg='stt && gittower .'
alias hn='hostname | pbcopy'
alias cpkey='cat ~/.ssh/id_rsa.pub | pbcopy'
alias browse='open .'
