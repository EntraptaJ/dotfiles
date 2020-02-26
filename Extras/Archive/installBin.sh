#!/usr/bin/env sh
SCRIPTS_PATH=./usr/bin
INSTALL_PATH=/usr/bin

FORCE_INSTALL=

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	FORCE_INSTALL=true;
else
	read -p "Are you certain you want to force installation on scripts. Are you sure? (y/n) " -n 1;
    printf "\n"
	if [[ $REPLY =~ ^[Yy]$ ]]; then 
        FORCE_INSTALL=true;
    else 
        FORCE_INSTALL=false;
	fi;
fi;

function installBinScript() {
    scriptBin="$(basename ${1})"
    localPath="$PWD/usr/bin/${scriptBin}"
    installScriptPath="/usr/local/bin/${scriptBin}"

    if [ -f "${installScriptPath}" ]; then
        if [ ${FORCE_INSTALL} == false ]; then
            read -p "Are you certain you want to replace ${installScriptPath}. Are you sure? (y/n) " -n 1;
            printf "\n"
            if ! [[ $REPLY =~ ^[Yy]$ ]]; then 
                printf "Not installing Script\n"
                continue
            fi;
        fi;

        rm -f ${installScriptPath}
    fi;

    printf "Copying Script ${localPath} to ${installScriptPath}\n"
    ln -s "${localPath}" "${installScriptPath}"

    printf "Installed ${scriptBin}\n"
}

function installBinScripts() {
    for binScript in ${SCRIPTS_PATH}/*; do
        installBinScript "${binScript}"
    done;
}

installBinScripts

printf "Done!\n"