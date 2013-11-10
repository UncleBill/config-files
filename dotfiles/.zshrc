# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fwalch"
# good themes: gozilla garyblessington fwalch miloshadzic
# theme gallery: https://www.dropbox.com/sh/u532agyv1hyash1/LS9yNESRlQ

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias goagentf='python /home/unclebill/projects/goagent/local/proxy.py'
alias goagent='nohup python /home/unclebill/projects/goagent/local/proxy.py $1 > /dev/null 2>&1 &'
#alias f55='nohup f5 &'
#http://stackoverflow.com/questions/4797050/how-to-run-process-as-background-and-never-die
function f55() { # run f5 background
    nohup f5 $1 > /dev/null 2>&1 &
    echo f5 is runing
}
function release-zip() {
    git archive --format=zip --output ./$1.zip $1
}
function dochub(){
    node ~/projects/dochub/web.js $1 > /dev/null 2>&1 &
    sleep 1.5 && google-chrome http://localhost:5000 $1 > /dev/null 2>&1
    # rm ./libpeerconnection.log && echo 'removed libpeerconnection.log' || echo 'not remove libpeerconnection.log'
}

alias py="python"
alias js="node"
alias ipy="ipython"
alias sound="alsamixer"
alias dB+='amixer set Master 2dB+'
alias dB-='amixer set Master 2dB-'
alias app+='sudo apt-get install -y'
alias app-='sudo apt-get remove'
alias npm+='sudo npm install'
alias gem+='sudo gem install'
alias npm-='sudo npm uninstall'
alias screen2dbox='import -window root -quality 98 ~/Dropbox/screenshot.png'
alias pip+='sudo pip install'
alias pip-='sudo pip uninstall'
alias pushall='git push -u origin --all'
alias addbill='git remote add bill '
alias gmm='git commit -m'
alias gdw='git diff --word-diff --color'
alias bl='tig blame '
alias chrome='google-chrome'
alias t='tig '
alias v='gvim '
alias rg='ranger '
alias va='gvim --remote '
alias j='jobs '
alias l='ls'
alias V='vim '
alias noTe='_today=$(date +%m-%d-%Y) && gvim $HOME/Dropbox/media/notes/$_today.markdown + -c "r !date +\<----------\%X\ @\%A"'
alias pdf='evince'
function c(){
    cd $1
    ls
}
function update-vim () {
    cd ~/vim && hg pull && hg update && make # VIMRUNTIMEDIR=/usr/share/vim/vim73
}
function vundle-update(){
    vim -c "execute \"NeoBundleUpdate\" | NeoBundleUpdateLog"
}

source ~/.zshrc-personal.zsh
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git last-working-dir copydir)

source $ZSH/oh-my-zsh.sh

#tmuxinator
 [[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Customize to your needs...
