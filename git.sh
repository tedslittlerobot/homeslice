
alias gitbattle='git shortlog -s -n'
alias gfap='git fetch --all --prune'

CLONESTREAM_URL=git@github.com:
CLONESTREAM_SUFFIX=.git
CLONESTREAM_UPSTREAM=
CLONESTREAM_ORIGIN=

function clonestream {
	# clonestream repo-name [folder origin upstream url suffix]

	HS_CS_URL_REPO=$1
	HS_CS_URL_FOLDER=$2
	HS_CS_URL_ORIGIN=${3:-$CLONESTREAM_ORIGIN}
	HS_CS_URL_UPSTREAM=${4:-$CLONESTREAM_UPSTREAM}
	HS_CS_URL_URL=${5:-$CLONESTREAM_URL}
	HS_CS_SUFFIX=${6:-$CLONESTREAM_SUFFIX}

	test -z $HS_CS_URL_ORIGIN && echo "Specify a git origin account as the third argument or CLONESTREAM_ORIGIN" >&2 && return
	test -z $HS_CS_URL_UPSTREAM && echo "Specify a git upstream account as the fourth argument or CLONESTREAM_UPSTREAM" >&2 && return

	git clone $HS_CS_URL_URL$HS_CS_URL_ORIGIN/$HS_CS_URL_REPO$HS_CS_SUFFIX $HS_CS_URL_FOLDER
	cd ${HS_CS_URL_FOLDER:-$HS_CS_URL_REPO}
	git remote add upstream $HS_CS_URL_URL$HS_CS_URL_UPSTREAM/$HS_CS_URL_REPO$HS_CS_SUFFIX
	git fetch --all
}
