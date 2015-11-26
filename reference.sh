
function homeslice {

	homeslice-ref-section "Homeslice Commands"

	homeslice-ref-command "upslice" "update and reload homeslice"
	homeslice-ref-command "reslice" "reload homeslice"

	homeslice-ref-section "General System Commands / Helpers"
	homeslice-ref-command "mkcd" "recursively create the directory, then cd into it"
	homeslice-ref-command "topcmd" "show your top commands from your shell's history"
	homeslice-ref-command "ansicolours" "show the ansi shell colour guide"
	homeslice-ref-command "ffs" "sudo the last command"

	homeslice-ref-section "Helpers for Web Services"

	homeslice-ref-command "transfer" "upload the given file to transfer.sh (linux: show the link; osx: copy the link to clipboard)"

	homeslice-ref-section "Git Helpers"
	homeslice-ref-command "gitbattle" "show the top committers in a git repo"

	homeslice-ref-section "Vagrant Helpers"

	homeslice-ref-command "vpf" "rerun osx's port forwarding script"
	homeslice-ref-command "vls" "list all running vagrant vms"
	homeslice-ref-command "vdown" "bring down all vagrant vms"

	homeslice-ref-section "Vagrant Box Helpers"

	homeslice-ref-note "if using laravel homestead, simply replace 'vm' with 'hs' for any commands that start with 'vm'"

	homeslice-ref-command "vmup" "bring the current vagrant box up (vagrant up)"
	homeslice-ref-command "vmssh" "ssh into the current vagrant box (vagrant ssh)"
	homeslice-ref-command "vmsr" "soft reset (vagrant halt && vagrant up)"
	homeslice-ref-command "vmhr" "hard reset (vagrant destroy -f && vagrant up)"
	homeslice-ref-command "vmp" "provision (vagrant provision)"
	homeslice-ref-command "vmdown" "bring the vagrant box down (vagrant halt)"

	homeslice-ref-section "PHP Helpers"

	homeslice-ref-command "artisan" "alias for 'php artisan'"

	homeslice-ref-section "OSX Helpers"

	homeslice-ref-command "ql" "open the file in osx's quicklook"
	homeslice-ref-command "gtt" "open the current dir in tower 2"
	homeslice-ref-command "hn" "copy your hostname to the clipboard"
	homeslice-ref-command "cpkey" "copy your public ssh key to the clipboard"
	homeslice-ref-command "browse" "open the current dir in finder"

}

function homeslice-ref-command {

	echo "\033[1;36m$1\033[0m: \033[1;34m$2\033[0m"

}

function homeslice-ref-section {

	echo
	echo "\033[4;1;35m$1\033[0m"
	echo
}

function homeslice-ref-note {

	echo "\033[37m$1\033[0m"
	echo

}
