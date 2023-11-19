#!/usr/bin/env zsh

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

if [ $(uname) = "Linux" ]; then
    # system
    export LANG=pl_PL.UTF-8
    export TERM="xterm-256color"

    # globals for libreoffice
    export VCL_ICONS_FOR_DARK_THEME=1
    
    # custom
    export SCREENSHOTS_DIR=${HOME}/Zrzuty\ ekranu

    # fzf
    export FZF_PATH=/usr/share/fzf
else
    # fzf
    export FZF_PATH=/usr/local/Cellar/fzf/0.37.0/shell
fi

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
export XDG_STATE_HOME="$XDG_CONFIG_HOME/state"
export XDG_DATA_DIRS="/usr/local/share:/usr/share:$XDG_DATA_HOME"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"    
export HISTSIZE=10000                   
export SAVEHIST=10000

# editor
export EDITOR="lvim"
export VISUAL="gedit"

# terminal
export TERM="xterm-kitty"

# clipmenu
export CM_IGNORE_WINDOW="Seahorse"

# jira-cli
export JIRA_AUTH_TYPE="bearer"

# hledger
export LEDGER_FILE="$HOME/Finanse/2023.journal"

