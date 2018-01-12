# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias nbes='npm i && bower i && ember s'
alias qa1='ssh johann.nieto@bookit-qa1.com'
alias qa7='ssh johann.nieto@bookit-qa7.com'
alias grepit='grep -rnIi --exclude-dir={ext-2.2,extjs,_javascript,assets,emberjs,node_modules,bower_components,tests,dist,tmp} --color' 
alias cdroot='cd ~/repos/bookit/'
alias cdb='cd ~/repos/bookit/'
alias cdrepos='cd ~/repos/'
alias cdsub='cd ~/repos/bookit/bookit.com/subdomains'
alias cdcss='cd ~/repos/bookit/bookit.com/subdomains/images/static/stylesheets'
alias cdjs='cd ~/repos/bookit/bookit.com/subdomains/images/static/javascript'
alias cdtemp='cd ~/repos/bookit/lib/templates'
alias cdclass='cd ~/repos/bookit/lib/classes'
alias cdtest='cd ~/repos/bookit/lib/tests/UnitTests'
alias cddat='cd ~/repos/ember-dateless-results'
alias cdcore='cd ~/repos/ember-core-services'
alias cdtp='cd ~/repos/ember-travel-planner'
alias mochaAll='~/repos/bookit/bookit.com/subdomains/images/static/javascript/node_modules/mocha/bin/mocha **/*.spec.js'
alias sqldev_old='mysql -u johann.nieto -h 172.19.1.32 -p --database=gds --ssl-mode DISABLED'
alias sqldev='mysql -u johann.nieto -h 10.3.100.13 -p --database=gds --ssl-mode DISABLED'
alias sqlqa1='mysql -u johann.nieto -h bookit-qa1.com -p --database=gds --ssl-mode DISABLED'
alias sqlqa7='mysql -u johann.nieto -h bookit-qa7.com -p --database=gds --ssl-mode DISABLED'
alias sqlintegration='mysql -u johann.nieto -h 10.10.10.241 -p --database=gds --ssl-mode DISABLED'
alias sqlprod='mysql -u johann.nieto -h dbslave201.mco.ld -p --database=gds --ssl-mode DISABLED'

mocha () { ~/repos/bookit/bookit.com/subdomains/images/static/javascript/node_modules/mocha/bin/mocha **/"$@"; }

export NVM_DIR="/home/johann/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH=$PATH:/home/johann/.local/bin
fortune | cowsay -W 80 -f `ls /usr/share/cowsay/cows | sort -R | head -1`
