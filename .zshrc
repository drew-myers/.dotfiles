# Default oh-my-zsh config
ZSH_THEME="robbyrussell"
plugins=(
  git
  vi-mode
)

# Run local and OS extensions right before sourcing oh-my-zsh
LOCAL_EXT=~/.local.zsh
if [[ -a $LOCAL_EXT ]]; then
    source $LOCAL_EXT
fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    source ~/.linux.zsh
elif [[ "$OSTYPE" == "darwin"* ]]; then
    source ~/.mac.zsh
fi

# Setup oh-my-zsh
export ZSH="/Users/acmyers/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Rando stuff I put on almost every computer
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

# No need to be gendered now
alias person="man"

