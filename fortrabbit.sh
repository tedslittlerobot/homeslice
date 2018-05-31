#! /usr/bin/env zsh

################# BASE COMMAND #################################################

function frb {
    test -z $1 && echo "You must specify an environment to use" >&2 && return
    test -z $2 && echo "You must specify an action!" >&2 && return
    FRB_DEPLOY_ENV=$1
    FRB_DEPLOY_ACTION=$2

    if [[ "$FRB_DEPLOY_ACTION" == "deploy" ]]; then
        frb_deploy $FRB_DEPLOY_ENV
    fi

    if [[ "$FRB_DEPLOY_ACTION" == "init" ]]; then
        frb_init $FRB_DEPLOY_ENV
        git fetch --all
    fi

    if [[ "$FRB_DEPLOY_ACTION" == "first-deploy" ]]; then
        frb_first_deploy $FRB_DEPLOY_ENV
    fi

    if [[ "$FRB_DEPLOY_ACTION" == "ssh" ]]; then
        frb_ssh $FRB_DEPLOY_ENV
    fi
}

################# ACTION: INIT #################################################

function frb_init {
    FRB_ENV=$1
    FRB_REPO=`frb_get_repo $FRB_ENV`
    git remote add `frb_remote_name $FRB_ENV` $FRB_REPO
}

################# ACTION: SSH ##################################################

function frb_ssh {
    FRB_ENV=$1
    SERVER=`frb_get_ssh $FRB_ENV`
    ssh $SERVER
}

################# ACTION: FIRST DEPLOY #########################################

function frb_first_deploy {
    FRB_ENV=$1
    CURRENT_BRANCH=`frb_get_current_branch`
    DEPLOY_BRANCH=`frb_get_branch $FRB_ENV`
    FRB_SERVER=`frb_get_ssh $FRB_ENV`
    FRB_APP_NAME=`frb_get_app_name $FRB_ENV`

    git fetch --all
    git checkout $DEPLOY_BRANCH

    git push -u `frb_remote_name $FRB_ENV` $DEPLOY_BRANCH\:refs/heads/master

    git checkout $CURRENT_BRANCH
}

################# ACTION: DEPLOY ###############################################

function frb_deploy {
    FRB_ENV=$1
    CURRENT_BRANCH=`frb_get_current_branch`
    DEPLOY_BRANCH=`frb_get_branch $FRB_ENV`
    FRB_SERVER=`frb_get_ssh $FRB_ENV`
    FRB_APP_NAME=`frb_get_app_name $FRB_ENV`

    git fetch --all
    git checkout $DEPLOY_BRANCH

    `frb_get_build_command $FRB_ENV`

    FRB_UPLOAD_DIR=`frb_get_build_dir $FRB_ENV`
    FRB_SERVER_UPLOAD_DIR="/srv/app/$FRB_APP_NAME/htdocs/$FRB_UPLOAD_DIR"

    ssh $FRB_SERVER mkdir -p $FRB_SERVER_UPLOAD_DIR
    scp -r $FRB_UPLOAD_DIR "$FRB_SERVER:$FRB_SERVER_UPLOAD_DIR"

    git push `frb_remote_name $FRB_ENV` ${DEPLOY_BRANCH}:master

    git checkout $CURRENT_BRANCH
}

################# HELPERS ######################################################

function frb_get_app_name {
    echo `cat ".deploy/$1" | head -1 | tail -1`
}

function frb_get_repo {
    echo `cat ".deploy/$1" | head -2 | tail -1`
}

function frb_get_ssh {
    echo `cat ".deploy/$1" | head -2 | tail -1 | cut -f1 -d":"`
}

function frb_get_branch {
    echo `cat ".deploy/$1" | head -3 | tail -1`
}

function frb_get_build_command {
    echo `cat ".deploy/$1" | head -4 | tail -1`
}

function frb_get_build_dir {
    echo `cat ".deploy/$1" | head -5 | tail -1`
}

function frb_get_current_branch {
    echo `git rev-parse --abbrev-ref HEAD`
}

function frb_remote_name {
    echo "fortrabbit-$1"
}
