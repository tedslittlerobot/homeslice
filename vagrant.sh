
# Vagrant global shortcuts

alias vls='VBoxManage list runningvms'

if [[ "$HOMESLICE_OS" == "osx" ]]; then
	# BSD's sed uses -E instead of -r
	alias vdown="VBoxManage list runningvms | sed -E 's/.*\{(.*)\}/\1/' | xargs -L1 -I {} VBoxManage controlvm {} savestate"
else
	alias vdown="VBoxManage list runningvms | sed -r 's/.*\{(.*)\}/\1/' | xargs -L1 -I {} VBoxManage controlvm {} savestate"
fi

alias vpf='sudo pfctl -evf /etc/pf.conf > /dev/null'

# Vagrant Box shortcuts

alias vmssh='ssh vagrant@127.0.0.1 -p 2222' # vagrant in
alias vmup='vagrant up' # up
alias vmsr='vagrant halt && vagrant up' # soft reset
alias vmhr='vagrant destroy -f && vagrant up' # hard reset
alias vmp='vagrant provision' # provision
alias vmdown='vagrant halt' # vagrant down

# reaload osx's port forwarding daemon
if [[ "$HOMESLICE_OS" == "osx" ]]; then
	alias vpf='sudo pfctl -evf /etc/pf.conf > /dev/null'
fi

# Homestead shortcuts

export HOMESTEAD_DIR=${HOMESTEAD_DIR:-~/Homestead}

alias stead='ssh vagrant@127.0.0.1 -p 2222'
alias hsup='pushd ${HOMESTEAD_DIR} >& /dev/null && vagrant up && popd >& /dev/null'
alias hssr='pushd ${HOMESTEAD_DIR} >& /dev/null && vagrant halt && vagrant up && popd >& /dev/null'
alias hshr='pushd ${HOMESTEAD_DIR} >& /dev/null && vagrant destroy -f && vagrant up && popd >& /dev/null'
alias hsp='pushd ${HOMESTEAD_DIR} >& /dev/null && vagrant provision && popd >& /dev/null'
alias hsd='pushd ${HOMESTEAD_DIR} >& /dev/null && vagrant halt && popd >& /dev/null'

alias sth='pushd ${HOMESTEAD_DIR} >& /dev/null && stt && popd >& /dev/null'
