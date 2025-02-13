# config.nu
#
# Installed by:
# version = "0.101.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options

$env.config.edit_mode = "vi"
$env.config.buffer_editor = "vi"
$env.EDITOR = "nvim"
alias vi = nvim
alias vim = nvim

source ~/.local.nu
$env.config.show_banner = false
$env.config.table.mode = "light"
