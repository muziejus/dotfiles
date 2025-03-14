# Loaded first, before .zprofile
# Should set everything that does not depend on an interactive shell.

export HOME=/Users/moacir

export EDITOR=nvim
export VISUAL=nvim


export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export zpath=$HOME/.zsh

PATH="$PATH:/Users/moacir/bin"
PATH="$PATH:/Library/TeX/texbin"
PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
PATH="$PATH:/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin"

export PATH

export PATH="$PATH:$POETRY_HOME/bin"
export PATH="$CARGO_PATH/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/bin:$PATH"

#. /opt/homebrew/opt/asdf/libexec/asdf.sh
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Load in secret files
source $HOME/.env

# Hopefully this will force prettierd to stop overriding local settings.

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.config"


export CARGO_PATH="$HOME/.cargo"
export GPG_TTY=$(tty)
export POETRY_HOME="/Users/moacir/Library/Application Support/pypoetry/venv/bin/poetry"
export PRETTIERD_LOCAL_PRETTIER_ONLY=1
export RAILS_ENV=development
export REPLYTO=moacir@moacir.com
export STARSHIP_CONFIG="/Users/moacir/.config/starship/starship.toml"
export WANDERTEXT_DEV_COUCHDB=http://admin:admin@127.0.0.1:5984/wandertext






# here you go. Surprised? (Jeremy will explain this someday)
export PAGER=less
export LESS='-eP"?f%f .?n?m(file %i of %m) ..?lbline %lb?L/%L. :byte %bB?s/%s. .?e(END) ?x- Next\: %x.:?pB%pB\%..%t"'

# History
export HISTFILE=$zpath/history
export HISTSIZE=5000
export SAVEHIST=$HISTSIZE



# trn happiness
NNTPSERVER=uchinews.uchicago.edu
ATTRIBUTION="%f posted:"
YOUSAID="You (%f) wrote:"
#REPLYTO="moacir@zuikis.uchicago.edu"
ORGANIZATION="1984 PRODUKTS"
NAME="Moacir"
#NAME="flaccid erudition"
export NNTPSERVER ATTRIBUTION YOUSAID REPLYTO ORGANIZATION NAME

# If I still used irc ever...
IRCNAME='Have read little and understood less.'
IRCNICK='Moacir'
IRCPATH=$HOME
IRCSERVER='irc.omnitel.net'
#IRCSERVER='irc.ais.net'
#IRCSERVER='irc.sprynet.com'
#IRCSERVER='irc.idle.net'
#IRCSERVER='irc.prison.net'
#IRCSERVER='irc.mcs.net'
#IRCSERVER='irc.mindspring.com'
#IRCSERVER='irc.arpa.com'
#IRCSERVER='irc.anet-stl.com'
#IRCSERVER='irc.emory.edu'
#IRCSERVER='irc.lagged.org'
export IRCNAME IRCNICK IRCPATH IRCSERVER
