command -v zsh >/dev/null 2>&1 || { echo >&2 "I require zsh but it's not installed.  Aborting."; exit 1; }
command -v curl >/dev/null 2>&1 || { echo >&2 "I require curl but it's not installed.  Aborting."; exit 1; }
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ln -sv ~/.dotfiles/.vimrc ~
ln -sv ~/.dotfiles/.zshrc ~
ln -sv ~/.dotfiles/.linux.zsh ~
ln -sv ~/.dotfiles/.mac.zsh ~
ln -sv ~/.dotfiles/.haskeline ~

rm -rf ~/.oh-my-zsh/custom
ln -sv ~/.dotfiles/oh-my-zsh-custom ~/.oh-my-zsh/custom

# Copy this one since it's to be locally customizable and this is just and empty template
cp ~/.dotfiles/.local.zsh ~
