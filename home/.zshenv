# XDG defaults just in case
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# Application home folders
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
export NVM_DIR=$HOME/.nvm # nvm
export PYENV_ROOT=$HOME/.pyenv # pyenv
export M_PREFIX=$HOME/.local

# Path extensions
export PATH=$HOME/.local/bin:$PATH # My local packages
export PATH=$HOME/.composer/vendor/bin:$PATH # Composer (PHP) executables
export PATH=$PYENV_ROOT/bin:$PATH # pyenv binaries
export PATH=$HOME/.rvm/bin:$PATH # RVM scripts and wrappers

# Other exports
export EDITOR=vim
export VIRTUAL_ENV_DISABLE_PROMPT=1 # Let Virtualenv prompt show up in the zsh theme.
export PYTHONDOCS=/usr/share/doc/python2/html/ # Needed for the python2-docs package.
export HISTIGNORE='pwd:exit:clear:jrnl:vault:pass:[ \t]*' # bash-specific
export LESSOPEN='| /usr/bin/src-hilite-lesspipe.sh %s' # syntax-highlight files
export LESS=' -R ' # allow color escape sequences
#export WINEARCH=win32 # should avoid some issues
export ANSIBLE_COW_SELECTION=satanic # Ready satanic cow template
export MOST_INITFILE=/usr/share/doc/most/lesskeys.rc # use less keys in most
export PAGER=most # uses most as pager by default
export QT_STYLE_OVERRIDE=adwaita # uses adwaita for qt5 applications
