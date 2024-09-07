# -----------------------------------------------------------------------------
# Env Variables
# -----------------------------------------------------------------------------

# ZSH Stuff
# ---------

export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
export MANPATH="/usr/local/man:$MANPATH"
export ARCHFLAGS="-arch x86_64"

# Homes?
# ------

export XDG_CONFIG_HOME=$HOME/.config
export HADOOP_HOME=$HOME/.local/hadoop-3.4.0
export HIVE_HOME=$HOME/.local/apache-hive-4.0.0
export JAVA_17_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export JAVA_24_HOME=/usr/lib/jvm/java-24-openjdk-amd64
export JAVA_HOME=$JAVA_24_HOME

# PATH
# ----

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$HIVE_HOME/bin:$PATH
export PATH=$HADOOP_HOME/bin:$PATH

# WSL Stuff
# ---------

export LIBGL_ALWAYS_INDIRECT=1

# -----------------------------------------------------------------------------
# Init oh-my-zsh
# -----------------------------------------------------------------------------

plugins=(git)
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

# -----------------------------------------------------------------------------
# fix WSL display issue
# -----------------------------------------------------------------------------

if [[ ! $(cat  /proc/1/cgroup | grep docker) ]]; then
	echo initiating DISPLAY
	export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
	echo DISPLAY set to $DISPLAY
fi

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
jars=/usr/local/lib/jars
config=${XDG_CONFIG_HOME}

# Configs
# -------

sshrc=${HOME}/.ssh
zshrc=${HOME}/.zshrc
gitrc=${HOME}/.gitconfig
vimrc=${XDG_CONFIG_HOME}/vim
nvimrc=${XDG_CONFIG_HOME}/nvim
tmuxrc=${XDG_CONFIG_HOME}/tmux/tmux.conf
weztermrc=${HOME}/.wezterm.lua

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

# Edit config aliases
# -------------------

alias sshrc="v ${sshrc}"
alias zshrc="v ${zshrc}"
alias gitrc="v ${gitrc}"
alias vimrc="v ${vimrc}"
alias nvimrc="v ${nvimrc}"
alias tmuxrc="v ${tmuxrc}"
alias weztermrc="v ${weztermrc}"

# Docker aliases
# --------------

alias plantuml-start="docker run -d -p 8080:8080 --name umlserver plantuml/plantuml-server:jetty"
alias plantuml-stop="sudo docker stop umlserver && sudo docker rm umlserver"

# Tool Aliases
# --------------

if `where krita &> /dev/null`;
then
    alias paint="krita"
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

~/fix-wsl-runtime-dir.sh
