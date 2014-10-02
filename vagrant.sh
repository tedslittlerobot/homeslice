
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

alias stead='ssh vagrant@127.0.0.1 -p 2222'
alias hsup='pushd ~/Homestead > /dev/null && vagrant up && popd >& /dev/null'
alias hssr='pushd ~/Homestead > /dev/null && vagrant halt && vagrant up && popd >& /dev/null'
alias hshr='pushd ~/Homestead > /dev/null && vagrant destroy -f && vagrant up && popd >& /dev/null'
alias hsp='pushd ~/Homestead > /dev/null && vagrant provision && popd >& /dev/null'
alias hsdown='pushd ~/Homestead > /dev/null && vagrant halt && popd >& /dev/null'
alias sth='pushd ~/Homestead > /dev/null && stt && popd >& /dev/null'
