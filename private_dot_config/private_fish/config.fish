if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_config theme choose dracula

    eval (/opt/homebrew/bin/brew shellenv)
    starship init fish | source

    set -gx SSH_AUTH_SOCK $HOME/.local/state/ssh/agent.sock
    set -gx SHELL /opt/homebrew/bin/fish
end
