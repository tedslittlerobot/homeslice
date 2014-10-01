
# transfer file

function transfer {
	if [[ "$HOMESLICE_OS" == "osx" ]]; then
		curl --upload-file ./$1 https://transfer.sh/$1 | pbcopy
	else
		curl --upload-file ./$1 https://transfer.sh/$1
	fi
}
