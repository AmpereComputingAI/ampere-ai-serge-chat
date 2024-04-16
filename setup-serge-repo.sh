#!/bin/bash

# Download serge repo
root_dir=`pwd`
repo_dir='serge'
tag_name="0.9.0"
url="https://github.com/serge-chat/$repo_dir.git"

rm -rf $repo_dir

if [ ! -d "$repo_dir" ] ; then
    git clone $url
    pushd $repo_dir
    git checkout -b $tag_name $tag_name
    popd
fi


# Copy logo files
pushd $repo_dir
rsync -avq $root_dir/static/ web/static/

# Apply patches
git apply --3way $root_dir/patch/deploy-sh.patch
git apply --3way $root_dir/patch/page-svelte.patch
git apply --3way $root_dir/patch/chat-page-svelte.patch
git apply --3way $root_dir/patch/api-routers-chat-py.patch
git apply --3way $root_dir/patch/vendor-requirements-txt.patch
