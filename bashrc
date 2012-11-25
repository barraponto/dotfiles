#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# git: make __git_ps1 available
source /usr/share/git/git-prompt.sh

# PS1='$rvm_ps1\w`__git_ps1` $ '
PS1='\[\e[1;34m\]$($HOME/.rvm/bin/rvm-prompt u g)\w\[\e[m\]\[\e[0;31m\]`__git_ps1` $ \[\e[m\]'

# ubuntu: load aliases from .bash_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# ubuntu: check window size after each command
shopt -s checkwinsize

# archwiki: prevent repeated commands on history
export HISTCONTROL=ignoredups

# ubuntuforums: leave some commands out of history log
export HISTIGNORE="&:??:[ ]*:clear:exit:logout"

# barraponto: set vim as editor
export EDITOR=vim

# archwiki: run keygen to automatically add ssh
eval `keychain --eval --agents ssh id_rsa --quiet`

# groucho: ~/.local/bin in path
PATH=$HOME/.local/bin:$PATH

# groucho: drush shortcuts
function drush-dlen () { drush dl $1 && drush en $1 --yes; }
function drush-undis () { drush dis $1 --yes && drush pm-uninstall $1 --yes; }

# commandlinefu: watch from youtube in mplayer
function yt () { mplayer -fs -quiet $(youtube-dl -g "$1"); }

if [ -f /etc/debian_version ]; then
 . /etc/bash_completion
fi

# nuvoleweb: load aliases from .drush_aliases
if [ -f ~/.drush_aliases ]; then
    . ~/.drush_aliases
fi

# pip: create virtualenvs in workon home
# export WORKON_HOME=$HOME/.virtualenvs
# export PIP_VIRTUALENV_BASE=$WORKON_HOME
# source /usr/bin/virtualenvwrapper.sh

#perlbrew: source the perlbrew
source ~/perl5/perlbrew/etc/bashrc

# nvm: source the nvm
source ~/.local/opt/nvm/nvm.sh

# ruby: add rubygems to the path
# rvm: add rvm to the path
PATH=$PATH:$(ruby -rubygems -e "puts Gem.user_dir")/bin:$HOME/.rvm/bin

# This loads RVM into a shell session.
[[ -s "/home/barraponto/.rvm/scripts/rvm" ]] && source "/home/barraponto/.rvm/scripts/rvm"

# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}
