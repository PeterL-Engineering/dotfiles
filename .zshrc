# ~/.zshrc: executed by zsh for interactive shells.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ---------- History ----------
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=2000
setopt HIST_IGNORE_DUPS      # don't record consecutive duplicates
setopt HIST_IGNORE_SPACE     # don't record lines starting with a space
setopt APPEND_HISTORY        # append to the history file, don't overwrite
setopt INC_APPEND_HISTORY    # write each command as it is entered

# ---------- Shell behavior ----------
setopt AUTO_CD               # type a directory name to cd into it

# make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

[[ $PWD == /mnt/c/Windows/System32 ]] && cd ~

# ---------- Colors ----------
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# ---------- Aliases ----------
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# ---------- Completion ----------
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# eval "$(keychain --eval --agents ssh id_ed25519)"

# ---------- Prompt (Pure) ----------
source ~/.zsh/pure.zsh

# ---------- Plugins (syntax-highlighting must stay last) ----------
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
