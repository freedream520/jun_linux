#!/usr/bin/env bash

set -e

# set envirionment
PWD=`pwd`
BASE_DIR="${PWD}"
SOURCE="$0"
while [ -h "$SOURCE"  ]; do # resolve $SOURCE until the file is no longer a symlink
    BASE_DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd  )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /*  ]] && SOURCE="$BASE_DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
BASE_DIR="$( cd -P "$( dirname "$SOURCE"  )" && pwd  )"

cd ${BASE_DIR}

DOCKER_REPOSTORY=myharbor.com
DOCKER_PROJECT=base
DOCKER_IMAGE=alpine

docker run -it --rm --name sshd -p 10022:22 ${DOCKER_REPOSTORY}/${DOCKER_PROJECT}/${DOCKER_IMAGE}:sshd ""
