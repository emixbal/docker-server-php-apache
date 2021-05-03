#!/bin/bash

mutika_repo_url=http://172.105.122.80:3000/Mitra/mustika_new_server.git #repo mustik
# 1_repo_url=http://172.105.122.80:3000/Mitra/mustika_new_server.git #repo client 1
# n_repo_url=http://172.105.122.80:3000/Mitra/mustika_new_server.git #repo client dst

src_dir="$PWD/src" #web root
cd "$src_dir"
if [ ! -d "$src_dir/core_mitra" ]
then
    echo "===> creating core_mitra directory "
    mkdir core_mitra
fi

# MUSTIKA
echo "==========>> MUSTIKA START <<=========="
echo "===> cd core_mitra "
cd "$src_dir/core_mitra"
if [ -d "$PWD/core_mustika" ]
then
    cd core_mustika
    echo "===> checkout to release "
    git checkout release
    echo "===> fetch last update "
    git fetch
    git pull origin release
    cd
else
    echo "===> repo baru detected "
    echo "===> clone new repo into core_mustika "
    git clone --single-branch --branch release $mutika_repo_url core_mustika
    cd
fi
echo "==========>> MUSTIKA END <<=========="
