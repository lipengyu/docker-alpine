#!/bin/bash

trap 'exit 2' ERR INT TERM

if [ -z ${GIT_URL} ]; then
    echo "GIT_URL is not set, aborting"
    exit 1
fi

if [ -z ${GIT_REF} ]; then
    echo "GIT_REF is not set, aborting"
    exit 1
fi

git clone ${GIT_URL} --progress project
cd project
git checkout -q ${GIT_REF}

if [ ! -z ${PROJECT_SUBDIR} ]; then
    cd ${PROJECT_SUBDIR}
fi

make ${MAKE_OPTIONS} ${MAKE_TARGET} ${MAKE_TARGETOPTIONS}
