# User configuration sourced by interactive shells

# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh# Path to your oh-my-zsh configuration.

# let sudo use the aliases (https://wiki.archlinux.org/index.php/Sudo#Passing_aliases)
alias sudo='sudo '

# Aliases
alias zshconfig="vim -p ~/.zshrc ~/.zimrc"
alias sshconfig="vim ~/.ssh/config"
alias vimconfig="vim -p ~/.vimrc.local ~/.vimrc.bundles.local"
alias i3config="vim -p ~/.config/i3/config ~/.config/i3blocks/config"
alias ssh-add='ssh-add -t 1h'
alias to-clipboard='xclip -selection c'
alias be='bundle exec'

# systemd aliases for common commands
systemd_commands=(
  daemon-reload disable enable halt hibernate hybrid-sleep
  poweroff reboot status start stop suspend reload restart)
for command in $systemd_commands; do; alias sc-$command="systemctl $command"; done

# HISTIGNORE aliases
alias jrnl=' jrnl'
alias vault=' vault'
alias pass=' pass'

# Path extensions
export PATH=$HOME/.composer/vendor/bin:$PATH # Composer (PHP) executables
export PATH=$HOME/.rvm/bin:$PATH # RVM scripts and wrappers
export PATH=$HOME/.config/yarn/global/node_modules/.bin:$PATH # My local packages
export PATH=$HOME/.local/bin:$PATH # My local packages

# Other exports
export EDITOR=vim # Bitch, please.
export VIRTUAL_ENV_DISABLE_PROMPT=1 # Let Virtualenv prompt show up in the zsh theme.
export PYTHONDOCS=/usr/share/doc/python2/html/ # Needed for the python2-docs package.
export HISTIGNORE='pwd:exit:clear:jrnl:vault:pass:[ \t]*' # bash-specific
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s" # syntax-highlight files
export LESS=' -R ' # allow color escape sequences
export WINEARCH=win32 # should avoid some issues
export ANSIBLE_COW_SELECTION=satanic # Ready satanic cow template
export MOST_INITFILE=/usr/share/doc/most/lesskeys.rc # use less keys in most
export PAGER=most # uses most as pager by default

# Gibo: gitignore boilerplates from simonwhitaker/gitignore-boilerplates.
source $HOME/.local/opt/gibo/gibo-completion.zsh

# Use solarized colors from sigurdga/ls-colors-solarized
eval `dircolors /home/barraponto/.local/opt/ls-colors-solarized/dircolors`

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
