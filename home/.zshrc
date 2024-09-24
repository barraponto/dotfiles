###################
#   trace start   #
###################
# PS4=$'%D{%s%7.}-_-'
# exec 3>&2 2>/tmp/sample-time.$$.log
# zmodload zsh/zprof
# setopt xtrace prompt_subst


# User configuration sourced by interactive shells
# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

 # -----------------
 # Zim configuration
 # -----------------

 # Use degit instead of git as the default tool to install and update modules.
 zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10,underline'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=10'

#
# pacman
#

# set pikaur as the default frontend for pacman
zstyle ':zim:pacman' frontend 'pikaur'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install


# setup redo
source $(redo alias-file)
# setup broot
source ~/.config/broot/launcher/bash/br

# let sudo use the aliases (https://wiki.archlinux.org/index.php/Sudo#Passing_aliases)
alias sudo='sudo '

# Aliases
alias vim=nvim
alias zshconfig='nvim -p ~/.zshrc ~/.zshenv ~/.zimrc'
alias sshconfig='nvim ~/.ssh/config'
alias vimconfig='nvim -p ~/.SpaceVim.d/init.toml ~/.SpaceVim.d/'
alias i3config='nvim -p ~/.config/i3/config.base ~/.config/i3status-rust/config.toml'
alias ssh-add='ssh-add -t 1h'
alias to-clipboard='pbcopy'
alias be='bundle exec'

# Modern best friends
alias cat=bat
alias df=duf
alias diff=batdiff
alias du=dust
alias dtrx='ouch decompress'
alias find=fd
alias grep=rg
alias ls=exa
alias man=batman
alias pass=gopass
alias sed=sd
alias tree=broot
alias youtube-dl=yt-dlp

# systemd aliases for common commands
# systemd_commands=(
#   daemon-reload disable enable halt hibernate hybrid-sleep
#   poweroff reboot status start stop suspend reload restart)
# for command in $systemd_commands; do; alias sc-$command="systemctl $command"; done

# HISTIGNORE aliases
alias jrnl=' jrnl'
alias vault=' vault'
alias pass=' gopass'
alias gopass=' gopass'

# custom functions

tabexpand () { # tabs to spaces. depends on coreutils expand.

  expand -t2 $1 > /tmp/tabexpand; mv /tmp/tabexpand $1;
}

utf8it () { # ensures the text file is utf8.
  ftfy -e ${2-utf8} $1 > /tmp/utf8it && mv /tmp/utf8it $1;
}

safecopy() { # uses rsync for safe progress-enabled copies
    rsync -pogbr -hhh --backup-dir=/tmp/rsync -e /dev/null --progress "$@"
}
compdef _files safecopy

# run taskwarrior on every shell
# task

#################
#   trace end   #
#################
# unsetopt xtrace
# zprof >! /tmp/zprof
# local line last
# while IFS= read -r line; do
#   if [[ ${line} =~ '^[0-9]+-_-' ]]; then
#     if [[ -n ${last} ]]; then
#       printf "%.6f %s\n" $(( (${line%%-_-*} - ${last%%-_-*}) / (10.0 ** 6) )) ${last#*-_-}
#     fi
#     last=${line}
#   fi
# done < /tmp/sample-time.(*).log > /tmp/ztrace.log

