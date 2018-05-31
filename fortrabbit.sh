#! /usr/bin/env zsh

################# BASE COMMAND #################################################

function frb {
    test -z $1 && echo "You must specify an environment to use" >&2 && return
    test -z $2 && echo "You must specify an action!" >&2 && return
    FRB_DEPLOY_ENV=$1
    FRB_DEPLOY_ACTION=$2
    FRB_CURRENT_BRANCH=`_frb_get_current_branch`

    if [[ "$FRB_DEPLOY_ACTION" == "deploy" ]]; then
        _frb_deploy $FRB_DEPLOY_ENV
    fi

    if [[ "$FRB_DEPLOY_ACTION" == "deploy-touch" ]]; then
        _frb_deploy_touch $FRB_DEPLOY_ENV
    fi

    if [[ "$FRB_DEPLOY_ACTION" == "push-assets" ]]; then
        _frb_push_assets $FRB_DEPLOY_ENV
    fi

    if [[ "$FRB_DEPLOY_ACTION" == "build-push" ]]; then
        _frb_build_and_push $FRB_DEPLOY_ENV
    fi

    if [[ "$FRB_DEPLOY_ACTION" == "init" ]]; then
        _frb_init $FRB_DEPLOY_ENV
    fi

    if [[ "$FRB_DEPLOY_ACTION" == "first-deploy" ]]; then
        _frb_first_deploy $FRB_DEPLOY_ENV
    fi

    if [[ "$FRB_DEPLOY_ACTION" == "ssh" ]]; then
        _frb_ssh $FRB_DEPLOY_ENV
    fi

    if [[ "$FRB_DEPLOY_ACTION" == "reset" ]]; then
        _frb_reset $FRB_DEPLOY_ENV
    fi

    git checkout $CURRENT_BRANCH
}

################# ACTION: INIT #################################################

function _frb_init {
    FRB_ENV=$1
    FRB_REPO=`_frb_get_repo $FRB_ENV`
    git remote add `_frb_remote_name $FRB_ENV` $FRB_REPO
    git fetch --all
}

################# ACTION: SSH ##################################################

function _frb_ssh {
    FRB_ENV=$1
    SERVER=`_frb_get_ssh $FRB_ENV`
    ssh $SERVER
}

################# ACTION: RESET ################################################

function _frb_reset {
    FRB_ENV=$1
    SERVER=`_frb_get_ssh $FRB_ENV`
    ssh $SERVER reset
}

################# ACTION: FIRST DEPLOY #########################################

function _frb_first_deploy {
    FRB_ENV=$1
    DEPLOY_BRANCH=`_frb_get_branch $FRB_ENV`
    FRB_SERVER=`_frb_get_ssh $FRB_ENV`
    FRB_APP_NAME=`_frb_get_app_name $FRB_ENV`

    git fetch --all
    git checkout $DEPLOY_BRANCH

    git push -u `_frb_remote_name $FRB_ENV` $DEPLOY_BRANCH\:refs/heads/master
}

################# ACTION: DEPLOY TOUCH #########################################

function _frb_deploy_touch {
    FRB_ENV=$1
    DEPLOY_BRANCH=`_frb_get_branch $FRB_ENV`
    FRB_SERVER=`_frb_get_ssh $FRB_ENV`

    git fetch --all
    git checkout $DEPLOY_BRANCH

    git push `_frb_remote_name $FRB_ENV` ${DEPLOY_BRANCH}:master
}

################# ACTION: DEPLOY ###############################################

function _frb_deploy {
    FRB_ENV=$1
    DEPLOY_BRANCH=`_frb_get_branch $FRB_ENV`
    FRB_SERVER=`_frb_get_ssh $FRB_ENV`

    git fetch --all
    git checkout $DEPLOY_BRANCH

    _frb_build_and_push $FRB_ENV

    git push `_frb_remote_name $FRB_ENV` ${DEPLOY_BRANCH}:master
}

################# ACTION: BUILD AND PUSH ASSETS ################################

function _frb_build_and_push {
    FRB_ENV=$1

    _frb_build $FRB_ENV
    _frb_push_assets $FRB_ENV
}

################# ACTION: PUSH ASSETS ##########################################

function _frb_push_assets {
    FRB_ENV=$1
    FRB_APP_NAME=`_frb_get_app_name $FRB_ENV`
    FRB_SERVER=`_frb_get_ssh $FRB_ENV`
    FRB_UPLOAD_DIR=`_frb_get_build_dir $FRB_ENV`
    FRB_SERVER_UPLOAD_PATH="/srv/app/$FRB_APP_NAME/htdocs/$FRB_UPLOAD_DIR"
    FRB_SERVER_UPLOAD_DIR=`dirname $FRB_SERVER_UPLOAD_PATH`

    ssh $FRB_SERVER mkdir -p $FRB_SERVER_UPLOAD_DIR
    scp -r $FRB_UPLOAD_DIR "$FRB_SERVER:$FRB_SERVER_UPLOAD_DIR"
}

################# HELPERS ######################################################

function _frb_build {
    `_frb_get_build_command $1`
}

function _frb_get_app_name {
    echo `cat ".deploy/$1" | head -1 | tail -1`
}

function _frb_get_repo {
    echo `cat ".deploy/$1" | head -2 | tail -1`
}

function _frb_get_ssh {
    echo `cat ".deploy/$1" | head -2 | tail -1 | cut -f1 -d":"`
}

function _frb_get_branch {
    echo `cat ".deploy/$1" | head -3 | tail -1`
}

function _frb_get_build_command {
    echo `cat ".deploy/$1" | head -4 | tail -1`
}

function _frb_get_build_dir {
    echo `cat ".deploy/$1" | head -5 | tail -1`
}

function _frb_get_current_branch {
    echo `git rev-parse --abbrev-ref HEAD`
}

function _frb_remote_name {
    echo "fortrabbit-$1"
}
