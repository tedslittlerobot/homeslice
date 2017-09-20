
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

# nicked from https://medium.com/remys-blog/getting-free-wifi-f5be887bd396

alias currentmacaddress="ifconfig en0 | grep ether | tail -n 1 | awk '{ print $2 }' | tail"
alias randommacaddress="openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'"
alias backupmacaddress="currentmacaddress > ~/.original_mac_address"
alias freewifi="sudo ifconfig en0 ether `randommacaddress`"
# @todo - backup and restore old mac addresses
