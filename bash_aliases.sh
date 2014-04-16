export EMAIL_ADDRESS=manyoso@yahoo.com

# Resolve the directory containing this script taken from http://stackoverflow.com/a/246128
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
export TOOLS_DIRECTORY=$DIR

git config --global user.email $EMAIL_ADDRESS

## Use git completion
source $TOOLS_DIRECTORY/git-completion.sh

## Make a nice bash prompt with git branch if available
PS1='\[\033[01;1;37m\]\u@\h:\[\033[01;1;33m\]\W$(__git_ps1 " (%s)")>\[\033[0m\] '

## Make sure that prompt has nice colors
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.flac=01;35:*.mp3=01;35:*.mpc=01;35:*.ogg=01;35:*.wav=01;35:'
alias ls='ls --color=auto'

## Some convenience alias for ls
alias l='ls'
alias la='ls -la'
alias ...='cd ../../'
alias ..='cd ../'

## Make sure that we're always using vim
alias vi='vim'

## Local paths
export PATH=/usr/lib/icecc/bin:~/local/bin:$TOOLS_DIRECTORY:$PATH
export LD_LIBRARY_PATH=~/local/lib:$LD_LIBRARY_PATH
export XDG_DATA_DIRS=~/local/share:$XDG_DATA_DIRS

## Use home grown editor script
export EDITOR=editor

## Easily source custom environment configuration
function setup
{
    if [ "$SETUP_CONFIG" != $1 ]; then
        echo "Setting up environment configuration '" $1 "'"
        source $TOOLS_DIRECTORY/setup/setup-$1
    fi
}

setup chrome
