
#Allow aliases to be with sudo
alias sudo="sudo "

#Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"
alias -- -="cd -"

#List Items
alias ls="ls -G" # list
alias la='ls -lAhGp'
alias ll="ls -Gl" # long list, excludes dot files
alias lla="ls -Gla" # long list all, includes dot files

#Volume Control
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="sudo osascript -e 'set volume 10'"

#IP/DNS
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'" # Get readable list of network IPs
alias flush="dscacheutil -flushcache" # Flush DNS cache

#Concatenate and print content of files (add line numbers)
alias catn="cat -n"

#Copy my public key to the pasteboard
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'"

#Empty the Trash on all mounted volumes and the main HDD
#Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

#Show/hide hidden files in Finder
alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

#Hide/show all desktop icons (useful when presenting)
alias showdeskicons="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hidedeskicons="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"

#MySQL
alias mysql='$MYSQL_HOME/bin/mysql'
alias mysqladmin='$MYSQL_HOME/bin/mysqladmin'
alias start_mysql='sudo $MYSQL_HOME/bin/mysqld_safe'
alias stop_mysql='sudo $MYSQL_HOME/bin/mysqladmin shutdown'
alias simpleserver='python -m SimpleHTTPServer 8000'

#Directories
alias iadir='cd ~/code/indestructibleart.com'
alias weatherdir='cd ~/code/WeatherApp'
alias dotfiles='cd ~/code/dotfiles'
alias personal='cd ~/code/PersonalSite'
alias jsla='cd ~/code/js.la'

#git
alias gs='git status'
alias aa='git add -A'
alias co="git checkout"
alias gb="git branch"
alias gs="git status"
alias gp="git push origin"
alias gc="git commit"

#ghwd
alias g=ghwd

#Lazy Git Commits
function m(){
  git add . -A
  if [ -z "$1" ]
    then
      N=0
      COMMITS=('Theme development' 'Module development' 'Upgrades' 'Misc development work')
      for i in "${COMMITS[@]}"
      do
        N=`expr $N + 1`
        echo "[${N}] ${i}"
      done

      read selection

      MESSAGE=${COMMITS[selection]}
      echo "${MESSAGE}"
      git commit -m "${MESSAGE}"

    else
      echo 'other'
      git commit -m $1
  fi
}

#Minecraft
alias minecraft="cd ~/Applications/Minecraft\ Server/ && java -Xmx1024M -Xms1024M -jar minecraft_server.1.6.4.jar"