export PATH=/usr/local/bin:/opt/local/bin:opt/local/sbin:$PATH
export MYSQL_HOME=/usr/local/mysql


# .bash_profile is executed for login shells, while .bashrc is executed for
# interactive non-login shells.
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh # This loads NVM

source ~/.bash_aliases
