set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_config theme choose dracula

    set -gx SSH_AUTH_SOCK $HOME/.local/state/ssh/agent.sock
    set -gx SHELL /opt/homebrew/bin/fish
    set -gx FLOX_SHELL /opt/homebrew/bin/fish
    set -gx PAGER /opt/homebrew/bin/ov
    set -gx BAT_PAGER "ov --quit-if-one-screen --header 3"

    eval (/opt/homebrew/bin/brew shellenv)
    direnv hook fish | source
    fzf --fish | source
    starship init fish | source

    for file in ~/.config/fish/after.d/*.fish
        source $file
    end
end
