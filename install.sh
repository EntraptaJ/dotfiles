#!/usr/bin/env sh

printf "This will forcibly install all of my 'docker run' based command line tools. If you don't understand every single thing in this project turn back now.\n"

BIN_SHA=$(wget -O - https://api.github.com/repos/K-FOSS/Docker/contents/Scripts | jq -r .[0].sha)

mkdir -p /tmp/macos
wget -O - https://api.github.com/repos/K-FOSS/Docker/tarball/${BIN_SHA} | tar xz -C /tmp/macos --strip-components=1