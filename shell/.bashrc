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
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
# Adds timestamp to command
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
# Backup history to alternate file in case of history loss
PROMPT_COMMAND="history -a ~/.bash_history_archive; history -a; $PROMPT_COMMAND"

export HISTSIZE=0
export HISTFILESIZE=0
export HISTSIZE=
export HISTFILESIZE=
history -r ~/.bash_history_archive
echo "Loaded $((`wc -l < .bash_history_archive | cut -f 1 -d ' '` / 2)) lines of history"
