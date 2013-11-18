#!/bin/bash

SRC_ROOT=$(pwd)
cd $(pwd)/device/lge/geefhd_hk/pacthes

function find_patch()
{
for dir in `find $@ -type f`
do
    if [ ${dir##*/} != "applypatches.sh" ];then
        #echo ${dir##*/}
        PATCH_NAME=$(basename $dir)
        PATCH_PATH=$(readlink -f $dir)
        PROJECT_TARGET=$(dirname $dir)
        PROJECT_TARGET=${PROJECT_TARGET##*./}
        cp $PATCH_PATH $SRC_ROOT/$PROJECT_TARGET
        cd $SRC_ROOT/$PROJECT_TARGET
        git am -3 $PATCH_NAME
        rm $PATCH_NAME
        cd -
    fi
done
}

function end()
{
    cd $SRC_ROOT
}

find_patch ./
end
