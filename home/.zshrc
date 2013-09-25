# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Use solarized colors from sigurdga/ls-colors-solarized
eval `dircolors /home/barraponto/.local/opt/ls-colors-solarized/dircolors`

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Powerline theme installed from jeremyFreeAgent/oh-my-zsh-powerline-theme
ZSH_THEME="powerline"

# Powerline theme options.
POWERLINE_HIDE_USER_NAME="true"
POWERLINE_HIDE_HOST_NAME="true"
POWERLINE_NO_BLANK_LINE="true"
POWERLINE_SHOW_GIT_ON_RIGHT="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(archlinux compleat fasd gem git github history-substring-search mercurial node npm pip python rvm screen sprunge systemd urltools vagrant virtualenv virtualenvwrapper)

# OH MY ZSH! from robbyrussell/oh-my-zsh.
source $ZSH/oh-my-zsh.sh

# Gibo: gitignore boilerplates from simonwhitaker/gitignore-boilerplates.
source ~/.local/opt/gitignore-boilerplates/gibo-completion.zsh

# Aliases
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim -p ~/.vimrc.local ~/.vimrc.bundles.local"
alias lodgeit="python2 ~/.local/opt/lodgeit-main/scripts/lodgeit.py"

# Path extensions
export PATH=$PATH:/opt/android-sdk/platform-tools:/opt/android-sdk/tools # Android SDK
export PATH=$PATH:/opt/grass/bin # Grass GIS
export PATH=$PATH:/opt/kde/bin # KDE stuff from kde3libs
export PATH=$PATH:/opt/qt/bin # QT stuff from qt3
export PATH=$PATH:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl # System Perl packages
export PATH=$PATH:$HOME/.rvm/bin # RVM scripts and wrappers
export PATH=$PATH:$HOME/.gem/ruby/1.9.1/bin # Local Ruby gems executables
export PATH=$PATH:$HOME/.cabal/bin # Local Cabal packages executables
export PATH=$PATH:$HOME/.local/npm-packages/bin # NPM global packages
export PATH=$PATH:$HOME/.local/bin # My local packages

# Other exports
export EDITOR=vim # Bitch, please.
export VIRTUAL_ENV_DISABLE_PROMPT=1 # Let Virtualenv prompt show up in the zsh theme.
export PYTHONDOCS=/usr/share/doc/python2/html/ # Needed for the python2-docs package.

# Get the keychain running.
eval `keychain --eval --agents ssh id_rsa --quiet`

# Scrapy helper functions
function scrapy-devel () { eval "echo '' > ~/Desktop/$1-results.csv && scrapy crawl --set=HTTPCACHE_ENABLED=1 $1 --output-format=csv --output=/home/barraponto/Desktop/$1-results.csv > ~/Desktop/$1-results.log" }
function scrapy-debug () { eval "echo '' > ~/Desktop/$1-results.csv && scrapy crawl --set=HTTPCACHE_ENABLED=1 --loglevel=INFO $1 --output-format=csv --output=/home/barraponto/Desktop/$1-results.csv > ~/Desktop/$1-results.log" }

# Tmuxinator tab names are overriden by zsh auto title.
export DISABLE_AUTO_TITLE='true'

