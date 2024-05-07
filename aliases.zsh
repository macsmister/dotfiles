#
# Miscellaneous
#
alias o='open'
alias cpr='cp -r'
alias rr='rm -r'
alias lr="ls -alR"

#
# Network
#
alias cleardns='dscacheutil -flushcache && sudo killall -HUP mDNSResponder'


#
# Git
#
alias yolo='git commit -m "$(curl -s http://whatthecommit.com/index.txt)"'

# Displays drives and space in human readable format
alias dfh='df -h'

# Stops ping after sending 5 ECHO_REQUEST packets
alias ping10='ping -c 5'

# Lists directories only, in long format
alias lsd='ls -l | grep --color=never "^d"'

# Lists hidden files in long format
alias lsh='ls -dlA .?*'

# Clears the console screen
alias c='clear'

#
# Editors
#
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

# Prints each $PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Displays information about the system
for command in winfetch neofetch screenfetch; do
    if type $command &> /dev/null; then
        alias sysinfo='$command'
        break
    fi
done

#
# Web browsers, e.g. opens file/URL in a particular browser
#
alias arc='open -a Arc'
alias edge='open -a Microsoft\ Edge'
alias firefox='open -a Firefox'
alias safari='open -a Safari'

# Toggles display of desktop icons
alias hide_desktop_icons='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'
alias show_desktop_icons='defaults write com.apple.finder CreateDesktop -bool true && killall Finder'

# Toggles hidden files in Finder
alias hide_hidden_files='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'
alias show_hidden_files='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'

# Toggles Spotlight
alias spotlight_off='sudo mdutil -a -i off'
alias spotlight_on='sudo mdutil -a -i on'

# Locks the session
alias lock='pmset displaysleepnow'

# Hibernates the system
alias hibernate='pmset sleepnow'

# Restarts the system
alias reboot='osascript -e "tell application \"System Events\" to restart"'

# Shuts down the system
alias poweroff='osascript -e "tell application \"System Events\" to shut down"'

# Detailed weather and forecast
if command -v curl > /dev/null; then
    alias forecast='curl --silent --compressed --max-time 10 --url "https://wttr.in?F"'
else
    alias forecast='wget -qO- --compression=auto --timeout=10 "https://wttr.in?F"'
fi

# Current weather
if command -v curl > /dev/null; then
    alias weather='curl --silent --compressed --max-time 10 --url "https://wttr.in/?format=%l:+(%C)+%c++%t+\[%h,+%w\]"'
else
    alias weather='wget -qO- --compression=auto --timeout=10 "https://wttr.in/?format=%l:+(%C)+%c++%t+\[%h,+%w\]"'
fi

# Keeps all apps and packages up to date.
# Syntax: `update [all]`
function update() {
    if command -v softwarepudate &> /dev/null; then
        echo 'Checking for system updates...'
        softwareupdate -l -i -a
    fi

    if command -v brew &> /dev/null; then
        echo 'Updating packages with Homebrew/Linuxbrew...'
        brew update
        brew upgrade
        brew cask update
        brew cleanup
    fi

    if [[ "$1" == 'all' ]]; then
        if command -v mas &> /dev/null; then
            echo 'Updating App Store applications...'
            mas upgrade
        fi
    fi

    if ! [[ "$OSTYPE" =~ ^darwin ]]; then
        if command -v apt &> /dev/null; then
            echo 'Updating packages with apt...'
            apt update
            apt full-upgrade
            apt autoremove
            apt clean
            apt autoclean
        fi

        if command -v apt-get &> /dev/null; then
            echo 'Updating packages with apt-get...'
            apt-get update
            apt-get upgrade
            apt-get dist-upgrade
        fi
    fi

    if command -v npm &> /dev/null; then
        echo 'Updating Node.js packages with npm...'
        which npm
        npm update -g
    fi

    if command -v npm &> /dev/null; then
        echo 'Updating Ruby gems...'
        which gem
        gem update --system
        gem update
        gem cleanup
    fi

    if command -v omz &> /dev/null; then
        echo 'Updating Oh My Zsh...'
        omz update
        omz reload
    fi
}

# Pull Ollama LLMs updates
alias llmpull='ollama pull llama2:13b && ollama pull llama2:latest && ollama pull llama2-uncensored:latest'

# Creates a directory and changes to it.
# Syntax: `mkcd <directory>`
function mkcd() {
    if [ -z "$1" ]; then
        echo "Usage: mkcd <path>"
        echo "Help: mkcd creates a directory if it doesn't exist, then changes to it."
        return 0
    fi

    mkdir -p -- "$@" && cd -P -- "$_" || exit;
}
alias take=mkcd

## Zscaler
alias start-zscaler="open -a /Applications/Zscaler/Zscaler.app --hide; sudo find /Library/LaunchDaemons -name '*zscaler*' -exec launchctl load {} \;"
alias kill-zscaler="find /Library/LaunchAgents -name '*zscaler*' -exec launchctl unload {} \;;sudo find /Library/LaunchDaemons -name '*zscaler*' -exec launchctl unload {} \;"