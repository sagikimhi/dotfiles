# -----------------------------------------------------------------------------
# Env Variables
# -----------------------------------------------------------------------------

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_DIRS=$XDG_DATA_DIRS:$HOME/.local/share

[ "$EDITOR" = "" ] && [ $(which nvim) 2> /dev/null ] && export EDITOR="nvim"
[ "$EDITOR" = "" ] && [ $(which vim) 2> /dev/null ] && export EDITOR="vim"
[ "$EDITOR" = "" ] && [ $(which nano) 2> /dev/null ] && export EDITOR="nano"

export LANG=en_US.UTF-8
export MAIL=/var/spool/mail/$USERNAME
export PATH="$PATH:$HOME/.local/bin"
export CPATH="$CPATH:$HOME/.local/include"
export MANPATH="$MANPATH:$HOME/.local/man"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/.local/lib"

# -----------------------------------------------------------------------------
# Oh My ZSH
# -----------------------------------------------------------------------------

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(\
    z cp git pip rust copypath emoji emoji-clock encode64 extract \
    qrcode rand-quote safe-paste web-search
)

[ -e "${ZSH}/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"

# -----------------------------------------------------------------------------
# Source Shell Configurations
# -----------------------------------------------------------------------------

[ -e "$HOME/.zshrc.functions" ] && source "$HOME/.zshrc.functions"
[ -e "$HOME/.zshrc.keybinds" ] && source "$HOME/.zshrc.keybinds"
[ -e "$HOME/.zshrc.options" ] && source "$HOME/.zshrc.options"
[ -e "$HOME/.zshrc.modules" ] && source "$HOME/.zshrc.modules"
[ -e "$HOME/.zshrc.tools" ] && source "$HOME/.zshrc.tools"
[ -e "$HOME/.zshrc.$USER" ] && source "$HOME/.zshrc.$USER"
[ -e "$HOME/.zshrc.aliases" ] && source "$HOME/.zshrc.aliases"
[ -e "$HOME/.zshrc.apikeys" ] && source "$HOME/.zshrc.apikeys"
[ -e "$HOME/.zshrc.prompt" ] && source "$HOME/.zshrc.prompt"

# -----------------------------------------------------------------------------
# Source User Configurations
# -----------------------------------------------------------------------------


