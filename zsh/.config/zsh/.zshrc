# Aliases
source ${ZDOTDIR}/.aliases

# Zsh settings
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt INC_APPEND_HISTORY        # Append into history file.
setopt HIST_IGNORE_DUPS          # Save only one command if 2 common are same and consistent.
setopt EXTENDED_HISTORY          # Add timestamp for each entry.
setopt AUTO_PUSHD                # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS         # Do not store duplicates in the stack.
setopt PUSHD_SILENT              # Do not print the directory stack after pushd or popd.

# Completion
source ${ZDOTDIR}/plugins/completion.sh  # Using this function

# Load prompt
fpath=(${ZDOTDIR}/prompt $fpath)
autoload -Uz prompt_purification_setup; prompt_purification_setup

# Set proper cursor for EDIT and INSERT modes
fpath=(${ZDOTDIR}/plugins $fpath)
autoload -Uz cursor_mode; cursor_mode

# Enable quick nested dir change by usinf bd
source "${ZDOTDIR}/plugins/bd.zsh"

# Enable fuzzy search with fzf
source ${FZF_PATH}/completion.zsh
source ${FZF_PATH}/key-bindings.zsh

# Enable vim keybings in shell provided by zsh-vi-mode
export KEYTIMEOUT=1
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Enable syntax highliting in shell. MUST be sourced at the end of the file!
source "${ZDOTDIR}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

