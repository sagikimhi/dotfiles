#!/bin/tcsh

# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------

# Text Aliases
# ------------

alias setDim tput dim
alias setBold tput bold
alias setHighlight tput smso
alias setUnderscore tput smul

alias setRed tput setaf 1
alias setGreen tput setaf 2
alias setYellow tput setaf 3
alias setBlue tput setaf 4
alias setMagneta tput setaf 5
alias setCyan tput setaf 6
alias setWhite tput setaf 7

alias unsetTextAttrs tput sgr0
alias unsetHighlight tput rmso
alias unsetUnderscore tput rmul

# Screen Aliases
# --------------

alias saveScreen tput smcup
alias restoreScreen tput rmcup
alias saveAndClearScreen tput smcup && clear

alias setCursorAt tput cup 
alias setCursorAtHome tput home

alias saveCursorLoc tput sc
alias resetCursorLoc tput rc
alias clearLineFromCursor tput el
