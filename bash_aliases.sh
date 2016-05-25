platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='macosx'
fi

# Resolve the directory containing this script taken from http://stackoverflow.com/a/246128
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
export TOOLS_DIRECTORY=$DIR

echo "Bash setup for $platform from $SOURCE"

## Local paths
if [[ $platform == 'linux' ]]; then
  export PATH=~/local/bin:~/local/swift/usr/bin:$TOOLS_DIRECTORY:$PATH
elif [[ $platform == 'macosx' ]]; then
  export PATH=/Applications/KDE/kate.app/Contents/MacOS:~/Qt/5.6/clang_64/bin:/usr/local/bin:$TOOLS_DIRECTORY:$PATH
fi

export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export XDG_DATA_DIRS=/usr/local/share:$XDG_DATA_DIRS

## Use home grown editor script
export EDITOR=editor

git config --global user.email $EMAIL_ADDRESS

## Use git completion
source $TOOLS_DIRECTORY/git-completion.sh

## Make a nice bash prompt with git branch if available
export PS1='\[\033[01;1;37m\]\u:\[\033[01;1;33m\]\w$(__git_ps1 " (%s)")>\[\033[0m\] '

## Make sure that prompt has nice colors
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.flac=01;35:*.mp3=01;35:*.mpc=01;35:*.ogg=01;35:*.wav=01;35:'
if [[ $platform == 'linux' ]]; then
  alias ls='ls --color=auto'
elif [[ $platform == 'macosx' ]]; then
  alias ls='gls --color=auto'
  alias rm='grm'
  alias code='~/dev/qt-creator-build/bin/Qt\ Creator.app/Contents/MacOS/Qt\ Creator -pid $QTCREATOR_PID'
  alias kate='code'
fi

# Some convenience alias for ls
alias l='ls'
alias la='ls -la'
alias ...='cd ../../'
alias ..='cd ../'

## Make sure that we're always using vim
alias vi='vim'

## Easily source custom environment configuration
function setup
{
    if [ "$SETUP_CONFIG" != $1 ]; then
        echo "Setting up environment configuration '" $1 "'"
        source $TOOLS_DIRECTORY/setup/setup-$1
    fi
}

setup default

# The next line updates PATH for the Google Cloud SDK.
source '/Users/atreat/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/Users/atreat/google-cloud-sdk/completion.bash.inc'

