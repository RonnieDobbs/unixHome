# System-wide .bashrc file for interactive bash(1) shells.

if [ -f /etc/bashrc  ] ; then
	. /etc/bashrc
fi

if [ -z "$PS1" ]; then
   return
fi

# SET ALIASES 
alias ll='ls -laG'
alias ls='ls -G'
alias h='history 10'
alias hpg='history | grep '
alias psg='ps -AEf | grep -i '
alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
alias mysql='/usr/local/mysql/bin/mysql'
alias mysqladmin='/usr/local/mysql/bin/mysqladmin'
alias top='top -o state -O cpu -s 5 -stats command,pid,ppid,cpu,rsize,vsize,time,pstate'

export PATH=$PATH:/Users/logan/tools:/usr/local/mysql/bin

############################
# SET PROMPT 
#
# BASIC
#	PS1='\h:\W \u\$ '
#
# No variables
# PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[1;32m\]'
# The core unit is \[\e[0,35m\]
# Extra brackets used as literals tend to cause problems with history and shopt
# RED=31,GREEN=32,YELLOW=33,BLUE=34,VIOLET=35,CYAN=36,WHITE=37
############################

RED="\[\e[0;31m\]"
RED_BRIGHT="\[\e[1;31m\]"
GREEN="\[\e[0;32m\]"
GREEN_BRIGHT="\[\e[1;32m\]"
YELLOW="\[\e[0;33m\]"
YELLOW_BRIGHT="\[\e[1;33m\]"
BLUE="\[\e[0;34m\]"
BLUE_BRIGHT="\[\e[1;34m\]"
VIOLET="\[\e[0;35m\]"
VIOLET_BRIGHT="\[\e[1;35m\]"
CYAN="\[\e[0;36m\]"
CYAN_BRIGHT="\[\e[1;36m\]"
WHITE="\[\e[0;37m\]"
WHITE_BRIGHT="\[\e[1;37m\]"
RESET="\[\e[m\]"

PS1="${RED_BRIGHT}${RED}\u@\h:${VIOLET_BRIGHT}\w${RED_BRIGHT} ] ${RESET}"

# Make bash check its window size after a process completes
shopt -s checkwinsize
shopt histappend histreedit histverify
shopt cmdhist # store multi-line commands as one command

# shopt histcontrol ignoredups
# shopt histignore ls:pwd:history
#	shopt histtimeformat 

export HISTIGNORE="&:ls:[bf]g:history:pwd:exit" # &=ignoredups
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "
