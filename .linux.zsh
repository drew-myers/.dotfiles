# Linux specific shell config

# User configuration
# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Kitty shell autocompletion
autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# Swap caps lock and escape
setxkbmap -option caps:escape

alias imgview="kitty +kitten icat"
