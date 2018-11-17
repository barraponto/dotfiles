# User configuration sourced by interactive shells

[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh # Start zim

eval "$(pyenv init -)" # Load pyenv
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"  # Load NVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM

# set up z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# let sudo use the aliases (https://wiki.archlinux.org/index.php/Sudo#Passing_aliases)
alias sudo='sudo '

# Aliases
alias zshconfig='vim -p ~/.zshrc ~/.zshenv ~/.zimrc'
alias sshconfig='vim ~/.ssh/config'
alias vimconfig='vim -p ~/.EverVim.vimrc ~/.EverVim.bundles ~/.vimrc.before.local'
alias i3config='vim -p ~/.config/i3/config.base ~/.config/i3status-rust/config.toml'
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
alias vault=' clipster --clipboard --ignore && vault'
alias pass=' pass'

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
