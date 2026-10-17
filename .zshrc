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
# "**" globbing works by default in zsh; window size is checked automatically.
setopt AUTO_CD               # type a directory name to cd into it (optional)

# make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# chroot name for the prompt
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# ---------- Prompt ----------
# user@host:dir$ with colors (green user@host, blue path)
autoload -Uz colors && colors
PROMPT='${debian_chroot:+($debian_chroot)}%B%F{green}%n@%m%f%b:%B%F{blue}%~%f%b%# '

# Set the terminal title to user@host: dir
case "$TERM" in
    xterm*|rxvt*)
        precmd() { print -Pn "\e]0;${debian_chroot:+($debian_chroot)}%n@%m: %~\a" }
        ;;
esac

# ---------- Colors ----------
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# ---------- Aliases ----------
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# ---------- Completion ----------
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# eval "$(keychain --eval --agents ssh id_ed25519)"

[[ $PWD == /mnt/c/Windows/System32 ]] && cd ~
setopt PROMPT_SUBST