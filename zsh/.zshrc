# -----------------------------------------------------------------------------
# Env Variables
# -----------------------------------------------------------------------------

export LANG=en_US.UTF-8
export MANPATH="/usr/local/man:$MANPATH"
export ARCHFLAGS="-arch x86_64"

# XDG Env Variables
# -----------------

export XDG_CONFIG_HOME=$HOME/.config

# HOME Env Variables 
# -------------------

export JAVA_17_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export JAVA_21_HOME=/usr/lib/jvm/java-21-openjdk-amd64
export JAVA_23_HOME=/usr/lib/jvm/java-23-openjdk-amd64
export APACHE_HOME=$HOME/.local/apache
export JAVA_HOME=$JAVA_23_HOME
export QT_HOME=$HOME/.local/Qt/6.7.3/gcc_64
export ZIG_HOME=$HOME/.local/zig
export ANT_HOME=$APACHE_HOME/ant
export TEX_HOME=$HOME/.local/texlive
export MARS_HOME=$HOME/.project/git/tools/mars
export CARGO_HOME=$HOME/.local/cargo
export THRIFT_HOME=$APACHE_HOME/thrift
export DOXYGEN_HOME=$HOME/.local/doxygen

# PATH
# ----

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$QT_HOME/bin:$PATH
export PATH=$ZIG_HOME/bin:$PATH
export PATH=$ANT_HOME/bin:$PATH
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$CARGO_HOME/bin:$PATH
export PATH=$THRIFT_HOME/bin:$PATH
export PATH=$DOXYGEN_HOME/bin:$PATH
export PATH=$TEX_HOME/bin/x86_64-linux:$PATH

# Linker Stuff
# ------------

export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$QT_HOME/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$ZIG_HOME/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$THRIFT_HOME/lib:$LD_LIBRARY_PATH

# Qt Stuff
# --------

export QT_DEBUG_PLUGINS=1
export QT_QPA_PLATFORM=xcb
export QT_PLUGIN_PATH=${QT_HOME}/plugins
export QT_QPA_PLATFORM_PLUGIN_PATH=${QT_HOME}/plugins

# -----------------------------------------------------------------------------
# Init oh-my-zsh
# -----------------------------------------------------------------------------

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# -----------------------------------------------------------------------------
# fix WSL display issue
# -----------------------------------------------------------------------------

if [[ ! $(cat  /proc/1/cgroup | grep docker) ]]; then
	echo initiating DISPLAY
    export DISPLAY=$(/bin/ip route | awk '/default/ { print $3 }'):0
    echo DISPLAY set to $DISPLAY
fi

# -----------------------------------------------------------------------------
# NVM (Node Version Manager) Stuff
# -----------------------------------------------------------------------------

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# -----------------------------------------------------------------------------
# Juliaup Stuff
# -----------------------------------------------------------------------------

path=('/home/skimhi/.juliaup/bin' $path)
export PATH

# -----------------------------------------------------------------------------
# Variables
# -----------------------------------------------------------------------------

# Editor
# ------

if `where nvim &> /dev/null`; then
    EDITOR="nvim"
elif `where vim &> /dev/null`; then
    EDITOR="vim"
else
    EDITOR="nano"
fi

# Directories
# -----------

loc=${HOME}/.local
lib=${HOME}/.local/lib
bin=${HOME}/.local/bin
git=${HOME}/.project/git
jars=${HOME}/.local/lib/jars
config=${HOME}/.config
project=${HOME}/.project
pyenvs=${HOME}/.local/python-venv
playground=${project}/playground

# Configuration Files and Directories
# -----------------------------------

vimrc=${HOME}/.vimrc
sshrc=${HOME}/.ssh
zshrc=${HOME}/.zshrc
nvimrc=${config}/nvim
gitrc=${config}/git/config
wezrc=${HOME}/.wezterm.lua
tmuxrc=${config}/tmux/tmux.conf

# Git Directories
# ---------------

mom=${git}/mom
uni=${git}/university
dot=${git}/SagiKimhi/dotfiles
xv6=${git}/tools/xv6-public
mygit=${git}/SagiKimhi

# -----------------------------------------------------------------------------
# Functions
# -----------------------------------------------------------------------------

function search() {
    if [ -n "$1" ] && [ -n "$2" ]
    then
        ll "$2" | grep "$1"
    elif [ -n "$1" ]
    then
        ll . | grep "$1"
    else
        echo "Usage: $0 <search-expr> [search-path]"
    fi
}

# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------

# Editor Aliases
# --------------

alias v="${EDITOR}"
alias edit="${EDITOR}"

# Command Aliases
# ---------------

# base-commands
alias so="source"
alias ls="ls --color=tty"
alias docker="sudo docker"
alias which-command='whence'

# ls
alias l="ls -lh --group-directories-first"
alias la="ls -lAh --group-directories-first"
alias ll="ls -lah --group-directories-first"
alias lsa="ls -lah"

# apt
alias aptfull="sudo apt-get update && sudo apt full-upgrade"
alias aptupdate="sudo apt-get update"
alias aptinstall="sudo apt-get install"
alias aptupstall="sudo apt-get update && sudo apt-get install"
alias aptupgrade="sudo apt-get update && sudo apt upgrade"

# cd
alias uni="cd $uni"

# configs
alias sshrc="v ${sshrc}"
alias zshrc="v ${zshrc}"
alias gitrc="v ${gitrc}"
alias vimrc="v ${vimrc}"
alias nvimrc="v ${nvimrc}"
alias tmuxrc="v ${tmuxrc}"
alias weztermrc="v ${weztermrc}"

# docker containers
alias plantuml-start="docker run -d -p 8080:8080 --name umlserver plantuml/plantuml-server:jetty"
alias plantuml-stop="docker stop umlserver && docker rm umlserver"

alias run-xv6="docker run -it --name xv6"
alias stop-xv6="docker stop xv6"

alias run-xv6-cs="docker run -it --name xv6-cs"
alias stop-xv6-cs="docker stop xv6-cs"

# tools
if `where krita &> /dev/null`;
then
    alias paint="krita"
fi

if [ -e ${jars}/bfg.jar ]; 
then
    alias bfg="java -jar ${jars}/bfg.jar"
fi

if [ -e ${git}/gf/gf2 ]; 
then
    alias gf2="${git}/gf/gf2"
fi

if `where clang-format &> /dev/null`;
then
    alias clangf-dump="clang-format --style='{BasedOnStyle: gnu, IndentWidth: 4, TabWidth: 4, UseTab: Never, BreakBeforeBraces: Linux, ColumnLimit: 80, PointerAlignment: Right}' --dump-config > .clang-format"
fi

if `where python3.11 &> /dev/null`;
then
    alias py311="python3.11"
fi
if `where python3.12 &> /dev/null`;
then
    alias py312="python3.12"
fi
if `where python3-venv &> /dev/null`;
then
    alias pyenv="python3 -m venv"
fi
if `where python &> /dev/null`;
then
    alias py="python"
    alias py3="python"
elif `where python3 &> /dev/null`;
then
    alias py="python3"
    alias py3="python3"
fi
alias pipupgrade="python -m pip --disable-pip-version-check list --outdated --format=json | python -c 'import json, sys; print(\"\\n\".join([x['name'] for x in json.load(sys.stdin)]))' | xargs -n1 pip install -U"

alias cosign="$(go env $loc/go)/bin/cosign"

alias naturaldocs="/mnt/c/Program\ Files\ \(x86\)/Natural\ Docs/NaturalDocs.exe"
