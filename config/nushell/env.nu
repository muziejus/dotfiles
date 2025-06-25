# env.nu
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
$env.editor = "nvim"
$env.visual = "nvim"

$env.xdg_config_home = "/Users/moacir/.config"
$env.xdg_data_home = "/Users/moacir/.config"

$env.poetry_home = "/Users/moacir/Library/Application Support/pypoetry/venv/bin/poetry"
$env.asdf_data_dir = "/Users/moacir/.asdf"
$env.cargo_path = "/Users/moacir/.cargo"
$env.GPG_TTY = ^tty
$env.prettierd_local_prettier_only = 1
$env.rails_env = "development"
$env.starship_config = "/Users/moacir/.config/starship/starship.toml"
$env.sharthip_shell = "nu"
$env.texinputs = ".:~/texmf/tex/latex/"
$env.texmfhome = ".:~/texmf/"


use std "path add"
# $env.PATH = ($env.PATH | split row (char esep))
# path add /some/path
# path add ($env.CARGO_HOME | path join "bin")
# path add ($env.HOME | path join ".local" "bin")
# $env.PATH = ($env.PATH | uniq)
path add /Library/TeX/texbin
path add /Users/moacir/bin
path add ($env.CARGO_PATH | path join "bin")
path add /opt/homebrew/bin
path add ($env.poetry_home | path join "bin")
path add ($env.asdf_data_dir | path join "shims")
path add /Applications/quarto/bin

$env.quarto_python = (poetry env info --path | str trim | path join "bin" "python")

# ("/Users/moacir/Library/Application 
#   Support/pypoetry/venv/bin/poetry/bin/poetry" env info --path | path join 
#   "bin" "python")
