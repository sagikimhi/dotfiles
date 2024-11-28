# -----------------------------------------------------------------------------
# Env Variables
# -----------------------------------------------------------------------------

export LANG=en_US.UTF-8

export PATH=${HOME}/.local/bin:/usr/local/bin:${PATH}

export MANPATH="/usr/local/man:${MANPATH}"

export ARCHFLAGS="-arch x86_64"

export XDG_CONFIG_HOME=${HOME}/.config

# -----------------------------------------------------------------------------
# Init oh-my-zsh
# -----------------------------------------------------------------------------

ZSH=${HOME}/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)
source ${ZSH}/oh-my-zsh.sh

# -----------------------------------------------------------------------------
# fix WSL display issue
# -----------------------------------------------------------------------------

if [[ ! $(cat  /proc/1/cgroup | grep docker) ]]; then
	echo initiating DISPLAY
    export DISPLAY=$(/bin/ip route | awk '/default/ { print $3 }'):0
    echo DISPLAY set to ${DISPLAY}
fi

# -----------------------------------------------------------------------------
# Variables
# -----------------------------------------------------------------------------

# editor
# ------

if `where nvim &> /dev/null`; then
    EDITOR="nvim"
elif `where vim &> /dev/null`; then
    EDITOR="vim"
else
    EDITOR="nano"
fi

# directories
# -----------

loc=${HOME}/.local
lib=${HOME}/.local/lib
bin=${HOME}/.local/bin
jars=${HOME}/.local/lib/jars
config=${XDG_CONFIG_HOME}

# configs
# -------

zshrc=${HOME}/.zshrc
ushrc=${HOME}/.zshrc.user
aliasrc=${HOME}/.zshrc.aliases
sshrc=${HOME}/.ssh
vimrc=${HOME}/.vimrc
gitrc=${config}/git/config
nvimrc=${config}/nvim
tmuxrc=${config}/tmux/tmux.conf

# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------

# base commands
# -------------

alias v="${EDITOR}"
alias so="source"
alias ls="ls --color=tty"
alias edit="${EDITOR}"
alias docker="sudo docker"
alias which-command='whence'

# ls
# --

alias l="ls -lh --group-directories-first"
alias la="ls -lAh --group-directories-first"
alias ll="ls -lah --group-directories-first"
alias lsa="ls -lah"

# apt
# ---

alias aptfull="sudo apt-get update && sudo apt full-upgrade"
alias aptupdate="sudo apt-get update"
alias aptinstall="sudo apt-get install"
alias aptupstall="sudo apt-get update && sudo apt-get install"
alias aptupgrade="sudo apt-get update && sudo apt upgrade"

# configs
# -------

alias zshrc="v ${zshrc}"
alias ushrc="v ${ushrc}"
alias aliasrc="v ${aliasrc}"
alias sshrc="v ${sshrc}"
alias gitrc="v ${gitrc}"
alias vimrc="v ${vimrc}"
alias nvimrc="v ${nvimrc}"
alias tmuxrc="v ${tmuxrc}"

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
# Source User Configs
# -----------------------------------------------------------------------------

source $HOME/.zshrc.skimhi
source $HOME/.zshrc.aliases

