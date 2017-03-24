# For use with developing on Android
if [ -d "$HOME/Android/Sdk" ]; then
  export ANDROID_HOME=~/Android/Sdk
fi

# Load RVM into a shell session *as a function*
if [ -d "$HOME/.rvm/scripts/rvm" ]; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
fi

# Add RVM to PATH for scripting
if [ -d "$HOME/.rvm/bin" ]; then
  export PATH="$PATH:$HOME/.rvm/bin"
fi

# Added by the Heroku Toolbelt
if [ -d "/usr/local/heroku" ]; then
  export PATH="/usr/local/heroku/bin:$PATH"
fi

# Used for vim-go plugin
if [ -d "$HOME/go" ]; then
  export GOPATH="$HOME/go"
fi

# alias gcc to colorgcc
if type "colorgcc" &> /dev/null; then
  alias gcc='colorgcc'
fi

# Set prompt to curr_dir>>
PS1='\W >> '

# 256 color Tmux 
if [ "$COLORTERM" ]; then
  export TERM=xterm-256color
fi

# Eternal bash history.
# ---------------------
#
# relevant links:
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
# http://superuser.com/questions/20900/bash-history-loss

# Adds timestamp to command
export HISTTIMEFORMAT="[%F %T] "

# WARNING: Setting HISTFILESIZE will truncate HISTFILE to whatever HISTFILESIZE gets set to.
# 
#   To prevent history loss, be sure to set HISTFILE to something other than the default, 
#     and be sure to save commands to a separate, alternate file for use as your "real" history.
#     This is achieved here by setting HISTFILE to ~/.bash_eternal_history, and by setting
#     the PROMPT_COMMAND to run `history -a ~/.bash_history_archive`.  The archive is loaded
#     afterward by clearing out the existing in-memory history and reading in the archive.
#     While not necessary for saving the archive, it makes the archive available to the 
#     `history` command.

# Change the file location because certain bash sessions truncate .bash_history file upon close.
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
# Backup history to alternate file in case of history loss
PROMPT_COMMAND="history -a ~/.bash_history_archive; $PROMPT_COMMAND"
# clear out in-memory history and saved history.
# WARNING: These two lines WILL clear out your existing history if it is not saved elsewhere!!!
export HISTSIZE=0
export HISTFILESIZE=0
# set in-memory history and saved history sizes back to "infinity"
export HISTSIZE=
export HISTFILESIZE=
# read "real" history from "real" history file
history -r ~/.bash_history_archive
# display number of commands loaded.  This is super optional, but I like seeing it.
echo "Loaded $((`wc -l < .bash_history_archive | cut -f 1 -d ' '` / 2)) lines of history"
