# Loaded after .zshenv and before .zshrc

PATH="/usr/local/bin"
PATH="$PATH:/Users/moacir/bin"
# PATH="$PATH:/Library/Frameworks/Python.framework/Versions/3.6/bin"
PATH="$PATH:/Library/TeX/texbin"
PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
PATH="$PATH:/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin"

export PATH

eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"
