#! /usr/bin/env bash

set -eux

declare -A repos=(
	["libmagic"]="https://github.com/file/file-tests.git"
	["corpus"]="https://github.com/openpreserve/format-corpus.git"
	["pronom"]="https://github.com/glepore70/pronom-research.git"
	["tika"]="https://github.com/apache/tika.git")


for key in "${!repos[@]}"; do
    if [ ! -d "$key" ] ; then
        git clone --depth=1 "${repos[$key]}" "$key"
	fi
done
