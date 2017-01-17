# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
source ~/.aliasrc

# set up path for android emulator
set ANDROID_HOME /Users/ignu/Library/Android/sdk
set PATH $PATH $ANDROID_HOME/tools
set PATH $PATH $ANDROID_HOME/platform-tools
