
export HOMESLICE_DIR=${HOMESLICE_DIR:-~/.homeslice}

function upslice {
	pushd ${HOMESLICE_DIR} > /dev/null
	git pull
	popd >& /dev/null
	reslice
}

function reslice {
	source ${HOMESLICE_DIR}/homeslice.sh
}

source ${HOMESLICE_DIR}/os.sh

source ${HOMESLICE_DIR}/vagrant.sh
source ${HOMESLICE_DIR}/php.sh
source ${HOMESLICE_DIR}/git.sh
source ${HOMESLICE_DIR}/web.sh
source ${HOMESLICE_DIR}/system.sh
source ${HOMESLICE_DIR}/projects.sh

# servers file

if [ -f ~/.servers ]; then
	source ~/.servers
fi
