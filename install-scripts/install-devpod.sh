#!/usr/bin/zsh

binary=devpod
amd_installation=devpod-linux-amd64
arm_installation=devpod-linux-arm64

build_directory=${HOME}/Downloads/${binary}-build
binary_directory=${HOME}/.local/bin


default_installation=$amd_installation

build_source=https://github.com/loft-sh/${binary}/releases/latest/download/${default_installation}
build_target=${build_directory}/${binary}
installation_source=${build_target}
installation_target=${binary_directory}/${binary}


if [[ ! "${HOME}/.local/bin" =~ '.*'(:)?$PATH(:)?'.*' ]]; then
    # echo "${HOME}/.local/bin:${PATH}" >> .zshrc # TODO: uncomment once validated later
    echo "${HOME}/.local/bin:${PATH}\n\n" 
else
    echo "${HOME}/.local/bin found in PATH environment variable\n\n"
fi

result=([ -f ${HOME}/.local/bin/devpod ]) \
    && mkdir -p $HOME/Downloads/devpod-build  \
    && cd $HOME/Downloads/devpod-build \
    && curl -L ${build_source} -o ${build_target} \
    && install -c -m 0755 ${build_target} ${installation_target} \
    && rm ${build_target}

if [[ ! $result ]];
then
    echo "Installation Failed."
else
    echo "devpod installed successfuly."
fi
