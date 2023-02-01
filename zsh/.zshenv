#!/usr/bin/env zsh

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

# system
export LANG=pl_PL.UTF-8
export TERM="xterm-256color"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"    
export HISTSIZE=10000                   
export SAVEHIST=10000

# editor
export EDITOR="nvim"
export VISUAL="gedit"

# globals for libreoffice
export VCL_ICONS_FOR_DARK_THEME=1

# custom
export SCREENSHOTS_DIR=${HOME}/Zrzuty\ ekranu

