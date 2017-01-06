#! /bin/bash

PWD=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
SRC_DIR=$PWD/../

docker run -it --rm -w ${SRC_DIR} \
	-v ${SRC_DIR}:${SRC_DIR}:rw \
	-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
	-v ${HOME}/.ccache:${HOME}/.ccache:rw \
	-e CCACHE_DIR=${HOME}/.ccache \
	-e LOCAL_USER_ID=`id -u` \
	px4io/px4-dev-nuttx:2017-01-07 /bin/bash -c "$@"
