ZSH_THEME="robbyrussell"
export ZSH=$HOME/.oh-my-zsh

export JAVA_HOME=/usr/lib/jvm/java-24-openjdk-amd64
export HIVE_HOME=$HOME/Downloads/apache-hive-4.0.0-bin
export HADOOP_HOME=$HOME/Downloads/hadoop-3.4.0

export XDG_CONFIG_HOME=$HOME/.config

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$HIVE_HOME/bin:$PATH
export PATH=$HADOOP_HOME/bin:$PATH

export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"
export MANPATH="/usr/local/man:$MANPATH"

plugins=(git)

source $ZSH/oh-my-zsh.sh

if [[ ! $(cat  /proc/1/cgroup | grep docker) ]]; then
	echo initiating DISPLAY
	export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
	echo DISPLAY set to $DISPLAY
fi

export LIBGL_ALWAYS_INDIRECT=1

# ----
# Sets
# ----

if `where nvim &> /dev/null`; then
    EDITOR="nvim"
elif `where vim &> /dev/null`; then
    EDITOR="vim"
else
    EDITOR="nano"
fi

# Search Paths (lib/bin/etc.)
# ---------------------------

bin=$HOME/.local/bin
lib=$HOME/.local/lib
jars=$HOME/.local/lib/jars
include=$HOME/.local/include

# Directories
# -----------

gitdir=${HOME}/.project/git-repos
confdir=${XDG_CONFIG_HOME}


mkdir -p $bin
mkdir -p $lib
mkdir -p $jars
mkdir -p $gitdir
mkdir -p $include
mkdir -p $confdir

# Configs
# -------

sshrc=${HOME}/.ssh
zshrc=${HOME}/.zshrc
gitrc=${HOME}/.gitconfig
vimrc=${HOME}/.config/vim
nvimrc=${HOME}/.config/nvim
tmuxrc=${HOME}/.config/tmux/tmux.conf
weztermrc=${HOME}/.wezterm.lua

# -------
# Aliases
# -------

# Editors Shortcuts
# -----------------

alias v="${EDITOR}"
alias edit="${EDITOR}"

# Command Shortcuts
# -----------------

alias so="source"

alias ls="ls --color=tty"
alias l="ls -lh --group-directories-first"
alias la="ls -lAh --group-directories-first"
alias ll="ls -lah --group-directories-first"
alias lsa="ls -lah"

alias update="sudo apt-get update"
alias upgrade="sudo apt upgrade"
alias full-upgrade="sudo apt full-upgrade"
alias which-command='whence'

# Edit config aliases
# -------------------

alias zshrc="v ${zshrc}"
alias gitrc="v ${gitrc}"
alias vimrc="v ${vimrc}"
alias nvimrc="v ${nvimrc}"
alias tmuxrc="v ${tmuxrc}"
alias sshrc="v ${sshrc}"
alias weztermrc="v ${weztermrc}"

# Tool Shortcuts
# --------------

if `where docker &> /dev/null`; then
    alias plantuml-start="docker run -d -p 8080:8080 --name umlserver plantuml/plantuml-server:jetty"
    alias plantuml-stop="sudo docker stop umlserver && sudo docker rm umlserver"
fi

if `where python &> /dev/null`; then
    alias py="python"
fi
if `where python3 &> /dev/null`; then
    alias py3="python3"
fi
if `where python3.11 &> /dev/null`; then
    alias py311="python3.11"
fi
if `where python3.12 &> /dev/null`; then
    alias py312="python3.12"
fi
if `where python3-venv &> /dev/null`; then
    alias pyenv="python3 -m venv"
fi

if `where krita &> /dev/null`; then
    alias paint="krita"
fi

if `where clang-format &> /dev/null`; then
    alias clangf-dump="clang-format --style='{BasedOnStyle: gnu, IndentWidth: 4, TabWidth: 4, UseTab: Never, BreakBeforeBraces: Linux, ColumnLimit: 80, PointerAlignment: Right}' --dump-config > .clang-format"
fi

if [[ -e ${gitdir}/gf/gf2 ]]; then
    alias gf2='${gitdir}/gf/gf2'
fi

function search() {
    if [ -n "$1" ] && [ -n "$2" ]
    then
        ll $1 | grep "$2"
    elif [ -n "$1" ]
    then
        ll . | grep "$1"
    else
        echo "Usage: $0 [search-path] <search-expr>."
    fi
}

~/fix-wsl-runtime-dir.sh
