# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/elbgi/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="cobalt2"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( git zsh-syntax-highlighting)

export PATH=/Users/elbgi/Library/Python/3.9/bin:$PATH

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='code'
else
  export EDITOR='code'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export Red='\033[1;91m'        # Red
export Yellow='\033[1;93m'     # Yellow
export Purple='\033[1;95m'     # Purple
export Cyan='\033[1;96m'       # Cyan
export NaN='\033[0m'           # Reset


alias ohmyzsh="code ~/.oh-my-zsh"
COMPLETION_WAITING_DOTS="true"

#AWS

#terminal shortcuts
alias zs='reset && source ~/.zshrc'
alias editzsh='code ~/.zshrc'
alias bash='code ~/.bash_profile'
alias sourcebash='source ~/.bash_profile'


export NVM_DIR=~/.nvm

unset npm_config_prefix
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 
#This loads nvm bash_completion
source $(brew --prefix nvm)/nvm.sh

# Git Aliases
alias clone='git clone'
alias gum='git push --set-upstream master'
alias gs='git status'
alias pull='git pull'
alias push='git push'

function commit() {
  echo $Blue 'checking status' $NaN
  gs
  echo 'files added'
  vared -p 'enter commit message:' -c msg
  echo "committing $msg..."
  git commit -a -m "$msg"
}


function work(){
  source ~/.zshrc
  cd ~/Desktop/$1/
  selected=""
  if [[ -z "$2" ]];
    then
      setopt -g
      apps=(*/)
      unsetopt -g
      echo "Select an app: "
      select app in $apps "All" "Quit";
      do
      if [[ "$app" == "Quit" ]]; 
        then 
        echo 'Quitting'
        break 
      fi 
      if [[ "$app" == "All" ]]; 
        then 
        selected=""
        break 
      fi
      selected="$app"
      break
      done  
  fi
  echo -e $Cyan Selected: $Purple $selected $NaN
  

  cd ~/Desktop/$1/$selected && code .
}


# npm

# other aliases
alias remove='rm -rf'

## Proxies
# yarn config set proxy $http_proxy --silent
# yarn config set https-proxy $http_proxy --silent
# yarn config set no-proxy $no_proxy --silent 
# yarn config set strict-ssl false --silent 

# NPM shortcuts

alias dev="npm run dev"
alias test="npm run test"
alias lint="npm run lint"
alias check='npm run lint && npm run test'

alias sb="npm run storybook"

 function savePassword(){
   vared -p 'New Password: ' -c psw
   touch ~/.password.md
   echo "# $psw" > ~/.password.md
 }

  function getPassword(){
    local foo=`cat ~/.password.md`
    echo $foo
 }

function fakport() {
   pid=$(sudo lsof -i tcp:$1 -t)  
IFS="^I$"

  if [[ -z $pid ]]
    then 
      echo -e $Yellow 'No Processes running in port' $1 $NaN
    else
      echo -e $Yellow Processes at port $1: $Cyan $pid $NaN 
      echo -e $Purple Execute order 66 $NaN 
      echo -e $Red 'killing process(es) :' $pid $NaN

echo $Yellow $pid $NaN
pids=$(echo "$pid" | xargs) 
      echo $Red $pids $NaN

      for p in $pids
        do
          echo "> [$p]"
          kill -9 $p && echo -e $Green "Process $p killed" $NaN 
        done

      
  fi
}

export fakport;

 function fak {
   source ~/.zshrc;
  while getopts '-pi' flag; do
  case "${flag}" in
    p) echo $Yellow "Killing port $2" $NaN
    fakport $2 ;;
    i) echo $Yellow "Killing process $2" $NaN
    kill -9 $2 && echo -e $Red "Process $2 killed" $NaN ;;
    *) echo  $Blue "Please use the following arguments: 
     -p: Specify port number (e.g. fak -p 3000) to kill localhost:3000
     -i: Specify PID number (e.g. fak -i 435302) to kill whatever is running there" $NaN
    exit 1 ;;
  esac
done


 
}



function mkd(){
  dn=""
  if [[ -z $1 ]]
    then 
      echo $Cyan 'directory name: ' $NaN
      read input
      dn="$input"
    else
      dn="$1"
  fi

echo $dn
  if [[ -z $dn ]]
    then
      
      echo $dn
      echo $Red Error $NaN
    else 
      mkdir $dn
      cd $dn
  fi

}

alias venv=". venv/bin/activate"



function gittem(){
   vared -p 'Message: ' -c message
   echo ${message}
   git commit -a -m ${message};
   git push
} 


alias material="npm install @mui/material @emotion/react @emotion/styled && npm install @mui/icons-material"

function git-rewrite() {
  # if path is folder add -r to git rm command
  vared -p 'Filepath: ' - path
   "git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch ${path}' \
  --prune-empty --tag-name-filter cat -- --all"
}

alias forcepush="git push origin --force --all"

