if status is-interactive
    # use fd by default 
    set -gx FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
    # use fd for ctrl+T (file picker, under current directory)
    set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
    # use fd for alt+C (directory picker, under current directory)
    set -gx FZF_ALT_C_COMMAND 'fd --type d --strip-cwd-prefix --hidden --follow --exclude .git'

    # set UI layout and default options
    set -gx FZF_DEFAULT_OPTS '--height 50% --layout=reverse --border'
    # preview files with 'bat' on Ctrl + T (falls back to directory tree/ls if item is a folder)
    set -gx FZF_CTRL_T_OPTS "--preview 'bat -n --color=always --line-range :500 {}'"
    # preview directory contents on Alt + C
    set -gx FZF_ALT_C_OPTS "--preview 'lsd -la --color=always --icon=always {}'"
end
