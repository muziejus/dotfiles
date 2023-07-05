# Loaded first, before .zprofile

#########################
#                       #
#   my .zshenv, sourced by all zsh shells
#                       #
#########################

# export TERM=xterm-256color 
# Don't set the terminal in here. Let the terminal program (alacritty) do it.

export HOME=/Users/moacir
export zpath=$HOME/.zsh

# Load in secret files
source $HOME/.env

# Hopefully this will force prettierd to stop overriding local settings.
export PRETTIERD_LOCAL_PRETTIER_ONLY=1

# export PYTHONPATH="/Applications/QGIS3.6.app/Contents/Resources/python/"
export POETRY_HOME="/Users/moacir/Library/Application Support/pypoetry/venv/bin/poetry"

# export LANG=lt_LT.UTF-8
# export LC_CTYPE=lt_LT.UTF-8
# export LANGUAGE=lt_LT.UTF-8
# export LANG=fr_FR.UTF-8
# export LC_CTYPE=fr_FR.UTF-8
# export LANGUAGE=fr_FR.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

#export RAILS_ENV=local
export RAILS_ENV=development

export WANDERTEXT_DEV_COUCHDB=http://admin:admin@127.0.0.1:5984/wandertext

# So gpg knows where to prompt for a password
export GPG_TTY=$(tty)

#umask 077  #sets default file protection to rwx for owner

export REPLYTO=moacir@moacir.com

# RealPlayer insists on this...
export LD_LIBRARY_PATH=/usr/local/rvplayer5.0

# here you go. Surprised? (Jeremy will explain this someday)
PAGER=less
LESS='-eP"?f%f .?n?m(file %i of %m) ..?lbline %lb?L/%L. :byte %bB?s/%s. .?e(END) ?x- Next\: %x.:?pB%pB\%..%t"'
export PAGER LESS

# Oh where to print to?

# History
export HISTFILE=$zpath/history
export HISTSIZE=5000
export SAVEHIST=$HISTSIZE

export EDITOR=nvim
export VISUAL=nvim

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

MOZILLA_HOME='/usr/local/netscape'
export MOZILLA_HOME
