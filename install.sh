# !/usr/bin/env bash

# Checks before running
command -v zsh >/dev/null 2>&1 || { echo >&2 "I require zsh but it's not installed.  Aborting."; exit 1; }
command -v curl >/dev/null 2>&1 || { echo >&2 "I require curl but it's not installed.  Aborting."; exit 1; }
# Install oh-my-zsh if it isn't already
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm -rf ~/.oh-my-zsh/custom
ln -sv ~/.dotfiles/oh-my-zsh-custom ~/.oh-my-zsh/custom

# Copy generic files
ln -sv ~/.dotfiles/.zshrc ~
ln -sv ~/.dotfiles/.vimrc ~
ln -sv ~/.dotfiles/.haskeline ~

# OS-specific config
if [[ "$OSTYPE" == "linux-"* ]]; then
    echo "copying linux os-specific config"
    ln -sv ~/.dotfiles/bspwm/ ~/.config/
    ln -sv ~/.dotfiles/cava/ ~/.config
    ln -sv ~/.dotfiles/kitty/ ~/.config
    ln -sv ~/.dotfiles/sxhkd/ ~/.config
    ln -sv ~/.dotfiles/compton/ ~/.config
    ln -sv ~/.dotfiles/ncmpcpp/ ~/.config
    ln -sv ~/.dotfiles/polybar/ ~/.config
    ln -sv ~/.dotfiles/qutebrowser/ ~/.config
    ln -sv ~/.dotfiles/.linux.zsh ~
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "copying mac os-specific config"
    ln -sv ~/.dotfiles/.mac.zsh ~
fi

# Copy this one since it's to be locally customizable and this is just and empty template
cp -n ~/.dotfiles/.local.zsh ~

