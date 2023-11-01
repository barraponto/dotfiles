# XDG defaults just in case
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# Application home folders
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
export NVM_DIR=$HOME/.nvm # nvm
export M_PREFIX=$HOME/.local

# Path extensions
export PATH=$HOME/.local/bin:$PATH # My local packages
export PATH=$HOME/.config/composer/vendor/bin:$PATH # Composer (PHP) executables
export PATH=$HOME/.rvm/bin:$PATH # RVM scripts and wrappers

# Other exports
export EDITOR=nvim
export VIRTUAL_ENV_DISABLE_PROMPT=1 # Let Virtualenv prompt show up in the zsh theme.
export HISTFILE=$HOME/.zsh_history
export HISTIGNORE='pwd:exit:clear:jrnl:vault:pass:gopass:[ \t]*' # bash-specific
export ANSIBLE_COW_SELECTION=satanic # Ready satanic cow template
export QT_STYLE_OVERRIDE=adwaita # uses adwaita for qt5 applications
export GTAGSLABEL=pygments
export PYTHON3_HOST_PROG=/usr/bin/python3
export FZF_DEFAULT_COMMAND='rg --files --hidden'
#export MOZ_USE_XINPUT2=1 # linux touchpad support
export LIBVA_DRIVER_NAME=nvidia
