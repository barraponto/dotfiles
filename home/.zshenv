# XDG defaults just in case
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# Application home folders
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Path extensions
export PATH=$HOME/.local/bin:$PATH # My local packages

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
export LIBVA_DRIVER_NAME=nvidia

#export MOZ_USE_XINPUT2=1 # linux touchpad support
