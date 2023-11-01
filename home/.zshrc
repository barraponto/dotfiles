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


# --------------------
# Module configuration
# --------------------

#
# completion
#

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
#zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

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

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
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
zstyle ':zim:pacman' frontend 'bb-wrapper'

# ------------------
# Initialize modules
# ------------------

if [[ ${ZIM_HOME}/init.zsh -ot ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# }}} End configuration added by Zim install


[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"  # Load NVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM

# setup redo
source $(redo alias-file)
# setup broot
source /home/barraponto/.config/broot/launcher/bash/br

# let sudo use the aliases (https://wiki.archlinux.org/index.php/Sudo#Passing_aliases)
alias sudo='sudo '

# Aliases
alias vim=nvim
alias zshconfig='nvim -p ~/.zshrc ~/.zshenv ~/.zimrc'
alias sshconfig='nvim ~/.ssh/config'
alias vimconfig='nvim -p ~/.SpaceVim.d/init.toml ~/.SpaceVim.d/'
alias i3config='nvim -p ~/.config/i3/config.base ~/.config/i3status-rust/config.toml'
alias ssh-add='ssh-add -t 1h'
alias to-clipboard='xclip -selection c'
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
systemd_commands=(
  daemon-reload disable enable halt hibernate hybrid-sleep
  poweroff reboot status start stop suspend reload restart)
for command in $systemd_commands; do; alias sc-$command="systemctl $command"; done

# HISTIGNORE aliases
alias jrnl=' jrnl'
alias vault=' vault'
alias pass=' gopass'


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

