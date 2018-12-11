HISTFILE=~/.history

HISTSIZE=10000
HISTORY_IGNORE="(ls|cd|pwd|exit|..|...|wat|gl|gfom|hg|cd ..)"
SAVEHIST=10000

setopt hist_ignore_dups
setopt share_history
setopt hist_verify
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_space
