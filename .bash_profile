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

##
# Your previous /Users/Omarcito/.bash_profile file was backed up as /Users/Omarcito/.bash_profile.macports-saved_2014-04-02_at_12:32:22
##

# MacPorts Installer addition on 2014-04-02_at_12:32:22: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

