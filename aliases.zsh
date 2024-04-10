#
# Miscellaneous
#
alias o='open'

#
# Network
#
alias cleardns='dscacheutil -flushcache && sudo killall -HUP mDNSResponder'

#
# Package managers
#
alias composer_install_fresh='rm -rf vendor/ composer.lock && composer install'
alias npm_install_fresh='rm -rf node_modules/ package-lock.json && npm install'

# Displays drives and space in human readable format
alias dfh='df -h'

# Stops ping after sending 4 ECHO_REQUEST packets
alias ping4='ping -c 4'

# Lists directories only, in long format
alias lsd='ls -l | grep --color=never "^d"'

# Lists hidden files in long format
alias lsh='ls -dlA .?*'

# Clears the console screen
alias c='clear'

# Editors
alias e='o -a Sublime\ Text'
alias v='o -a MacVim'
alias vi='vim'
alias svi='sudo vi'
alias se='sudo open -a Sublime\ Text'
alias sv='sudo open -a MacVim'

# Local/UTC date and time in ISO-8601 format `YYYY-MM-DDThh:mm:ss`
alias now='date +"%Y-%m-%dT%H:%M:%S"'
alias unow='date -u +"%Y-%m-%dT%H:%M:%S"'

# Date in `YYYY-MM-DD` format
alias nowdate='date +"%Y-%m-%d"'
alias unowdate='date -u +"%Y-%m-%d"'

# Time in `hh:mm:ss` format
alias nowtime='date +"%T"'
alias unowtime='date -u +"%T"'

# Unix time stamp
alias timestamp='date -u +%s'

# External IP address
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
#alias ip='curl ipinfo.io/ip'
