export PATH=/usr/local/bin:/opt/local/bin:opt/local/sbin:$PATH

export MYSQL_HOME=/usr/local/mysql
# Allow aliases to be with sudo
alias sudo="sudo "

# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"
alias -- -="cd -"

alias ls="ls -G" # list
alias la="ls -Ga" # list all, includes dot files
alias ll="ls -Gl" # long list, excludes dot files
alias lla="ls -Gla" # long list all, includes dot files

alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="sudo osascript -e 'set volume 10'"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"

# Get readable list of network IPs
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias flush="dscacheutil -flushcache" # Flush DNS cache

# Concatenate and print content of files (add line numbers)
alias catn="cat -n"

# Copy my public key to the pasteboard
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Show/hide hidden files in Finder
alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias showdeskicons="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hidedeskicons="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"

alias mysql=$MYSQL_HOME/bin/mysql

alias mysqladmin=$MYSQL_HOME/bin/mysqladmin

alias start_mysql='sudo $MYSQL_HOME/bin/mysqld_safe'

alias stop_mysql='sudo $MYSQL_HOME/bin/mysqladmin shutdown'

alias simpleserver='python -m SimpleHTTPServer 8000'

alias iadir='cd ~/code/indestructibleart.com'

alias weatherdir='cd ~/code/WeatherApp'

alias dotfiles='cd ~/code/dotfiles'

# Minecraft
alias minecraft="cd ~/Applications/Minecraft\ Server/ && java -Xmx1024M -Xms1024M -jar minecraft_server.1.6.4.jar"

# .bash_profile is executed for login shells, while .bashrc is executed for
# interactive non-login shells.
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

[[ -s /Users/Omarcito/.nvm/nvm.sh ]] && . /Users/Omarcito/.nvm/nvm.sh # This loads NVM
