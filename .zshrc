# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/acmyers/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(
  git
  vi-mode
)

source $ZSH/oh-my-zsh.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/acmyers/.sdkman"
[[ -s "/Users/acmyers/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/acmyers/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"


export PATH="$PATH:$HOME/.cargo/bin:$PATH:/usr/local/go/bin"

LOCAL_EXT=~/.local.zsh
if [[ -a $LOCAL_EXT ]]; then
    source $LOCAL_EXT
fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    source ~/.linux.zsh
elif [[ "$OSTYPE" == "darwin"* ]]; then
    source ~/.mac.zsh
fi
