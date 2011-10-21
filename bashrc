#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '
PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]$(__git_ps1 "(%s)") $ \[\e[m\]\[\e[0;32m\] '

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

# rvm : loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

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

# virtualenvwrapper: make virtualenvs work nice
source ~/.local/bin/virtualenvwrapper.sh
