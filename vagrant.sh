
# Vagrant shortcuts

alias vin='ssh vagrant@127.0.0.1 -p 2222' # vagrant in
alias vup='vagrant up' # up
alias vsr='vagrant halt && vagrant up' # soft reset
alias vhr='vagrant destroy -f && vagrant up' # hard reset
alias vp='vagrant provision' # provision
alias vd='vagrant halt' # vagrant down

# Homestead shortcuts

alias stead='ssh vagrant@127.0.0.1 -p 2222'
alias hup='pushd ~/Homestead && vagrant up && popd'
alias hsr='pushd ~/Homestead && vagrant halt && vagrant up && popd'
alias hhr='pushd ~/Homestead && vagrant destroy -f && vagrant up && popd'
alias hp='pushd ~/Homestead && vagrant provision && popd'
alias hd='pushd ~/Homestead && vagrant halt && popd'

alias sth='pushd ~/Homestead && stt && popd'
alias hpf='sudo pfctl -evf /etc/pf.conf > /dev/null'
