# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

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

# Tmuxinator tab names are overriden by zsh auto title.
export DISABLE_AUTO_TITLE='true'

# Ready satanic cow template
export ANSIBLE_COW_SELECTION=satanic

# Aliases
alias zshconfig="vim ~/.zshrc"
alias sshconfig="vim ~/.ssh/config"
alias vimconfig="vim -p ~/.vimrc.local ~/.vimrc.bundles.local"
alias i3config="vim -p ~/.config/i3/config ~/.config/i3blocks/config"
alias lodgeit="python2 ~/.local/opt/lodgeit-main/scripts/lodgeit.py"
alias vimtabs="parallel -Xj1 --tty vim -p"

# HISTIGNORE aliases
alias jrnl=' jrnl'
alias vault=' vault'

tabexpand () {
  expand -t2 $1 > /tmp/tabexpand; mv /tmp/tabexpand $1;
}

# Path extensions
#export PATH=/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$PATH # System Perl packages
export PATH=$HOME/.cabal/bin:$PATH # Local Cabal packages executables
export PATH=$HOME/.composer/vendor/bin:$PATH # Composer (PHP) executables
#export PATH=$HOME/.rvm/bin:$PATH # RVM scripts and wrappers
export PATH=$HOME/.local/bin:$PATH # My local packages

# Other exports
export EDITOR=vim # Bitch, please.
export VIRTUAL_ENV_DISABLE_PROMPT=1 # Let Virtualenv prompt show up in the zsh theme.
export PYTHONDOCS=/usr/share/doc/python2/html/ # Needed for the python2-docs package.
export HISTIGNORE='pwd:exit:clear:jrnl:vault:[ \t]*' # does not work in zsh
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '
export WINEARCH=win32 # should avoid some issues

# Get the keychain running.
eval `keychain --eval --agents ssh id_rsa --quiet`

# Scrapy helper functions
function scrapy-devel () { eval "echo '' > ~/Desktop/$1-results.csv && scrapy crawl --set=HTTPCACHE_ENABLED=1 $1 --output-format=csv --output=/home/barraponto/Desktop/$1-results.csv > ~/Desktop/$1-results.log" }
function scrapy-debug () { eval "echo '' > ~/Desktop/$1-results.csv && scrapy crawl --set=HTTPCACHE_ENABLED=1 --loglevel=INFO $1 --output-format=csv --output=/home/barraponto/Desktop/$1-results.csv > ~/Desktop/$1-results.log" }


# Use solarized colors from sigurdga/ls-colors-solarized
eval `dircolors /home/barraponto/.local/opt/ls-colors-solarized/dircolors`

