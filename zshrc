# Loaded after .zshenv 
# This is loaded for all interactive shells.

export NU_CONFIG_DIR="/Users/moacir/.config/nushell"

# source ~/.zsh/aliases

#umask 077  #sets default file protection to rwx for owner

# added by travis gem
[ -f /Users/moacir/.travis/travis.sh ] && source /Users/moacir/.travis/travis.sh


source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"

eval "$(starship init zsh)"

# nu

. "$HOME/.local/bin/env"
