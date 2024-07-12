export ZSH="$HOME/.oh-my-zsh"

export XDG_CONFIG_HOME="$HOME/.config"
export HADOOP_HOME=$HOME/Downloads/hadoop-3.4.0
export HIVE_HOME=$HOME/Downloads/apache-hive-4.0.0-bin
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$HIVE_HOME/bin:$PATH
export PATH=$HADOOP_HOME/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=/project/local/bin:$PATH

export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"

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

zshrc=${HOME}/.zshrc
vimrc=${HOME}/.config/vim
nvimrc=${HOME}/.config/nvim
tmuxrc=${HOME}/.config/tmux/tmux.conf

gitdir=${HOME}/Project/git-repos
confdir=${XDG_CONFIG_HOME}
projdir=${HOME}/Project
mygitdir=${gitdir}/${USER}

# -------
# Aliases
# -------

alias v="${EDITOR}"

alias so="source"

alias update="sudo apt-get update"
alias upgrade="sudo apt upgrade"
alias full-upgrade="sudo apt full-upgrade"

alias ls="ls --color=tty"
alias l="ls -lh --group-directories-first"
alias la="ls -lAh --group-directories-first"
alias ll="ls -lah --group-directories-first"
alias lsa="ls -lah"

alias which-command='whence'

alias zshrc="v ${zshrc}"
alias gitrc="v ${gitrc}"
alias vimrc="v ${vimrc}"
alias nvimrc="v ${nvimrc}"
alias tmuxrc="v ${tmuxrc}"

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

if [[ -e ${gitdir}/gf/gf2 ]]; then
    alias gf2='${gitdir}/gf/gf2'
fi

if `where clang-format &> /dev/null`; then
    alias clangf-dump="clang-format --style='{BasedOnStyle: gnu, IndentWidth: 4, TabWidth: 4, BreakBeforeBraces: Linux}' --dump-config > .clang-format"
fi
