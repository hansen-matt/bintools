# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Expand variables in PS1
shopt -s promptvars

# vim mode
#set -o vi

# ls after cd
function cd {
	builtin cd "$@" && ls --color=always -a
}

# editor
export VISUAL=vim
export EDITOR="$VISUAL"
export PATH=/usr/local/MATLAB/R2021a/bin:/opt/Xilinx/Vivado/2018.2/bin:~/bin:$HOME/git/iris_firmware/tools/PCAP_to_CSV/build:$HOME/git/iris_firmware/tools/plot_CSV_from_PCAP/python:$HOME/git/iris_firmware/tools/scripts/:/usr/local/ARMCompiler6.6.4/bin:$PATH
export ENVISION_DEPS=$HOME/git/envision/Envision_depends
export HISTTIMEFORMAT="%m/%d/%y %T "
export MLM_LICENSE_FILE=27000@10.0.7.22
export ARMLMD_LICENSE_FILE="27001@172.16.15.225"
mkdir -p "$HOME/.vim/undo"
mkdir -p "$HOME/.vim/backup"
mkdir -p "$HOME/.vim/swap"


eval $(thefuck --alias)

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

function PWDN {
  pwd | awk -F\/ '{print $(NF-1),$(NF)}' | sed 's/ /\//'
}

if [ "$color_prompt" = yes ]; then
 	export RED='\[\033[0;31m\]'
	export BLUE='\[\033[0;34m\]'
	export NO_COLOUR='\[\033[0m\]'

  export RS='\[\033[0m\]'    # reset
  export HC='\[\033[1m\]'    # hicolor
  export UL='\[\033[4m\]'    # underline
  export INV='\[\033[7m\]'   # inverse background and foreground
  export FBLK='\[\033[30m\]' # foreground black
  export FRED='\[\033[31m\]' # foreground red
  export FGRN='\[\033[32m\]' # foreground green
  export FYEL='\[\033[33m\]' # foreground yellow
  export FBLE='\[\033[34m\]' # foreground blue
  export FMAG='\[\033[35m\]' # foreground magenta
  export FCYN='\[\033[36m\]' # foreground cyan
  export FWHT='\[\033[37m\]' # foreground white
  export BBLK='\[\033[40m\]' # background black
  export BRED='\[\033[41m\]' # background red
  export BGRN='\[\033[42m\]' # background green
  export BYEL='\[\033[43m\]' # background yellow
  export BBLE='\[\033[44m\]' # background blue
  export BMAG='\[\033[45m\]' # background magenta
  export BCYN='\[\033[46m\]' # background cyan
  export BWHT='\[\033[47m\]' # background white

  #PS1='$HC$FYEL\!$RS \t $RED[$BLUE\[`tput bold`\]\u@\h$NO_COLOUR ${PWD%"${PWD%/*/*}/"} \[`tput sgr0`\]$RED]\\\$ $NO_COLOUR'
  #PS1="$HC$FYEL\!$RS \t $RED[$BLUE\[`tput bold`\]\u@\h$NO_COLOUR \W\[`tput sgr0`\]$RED]\\\$ $NO_COLOUR"
  PS1="$HC$FYEL\!$RS \t $RED[$BLUE\[`tput bold`\]\u@\h$NO_COLOUR \$(PWDN 3)\[`tput sgr0`\]$RED]\\\$ $NO_COLOUR"
  #   PS1='$FYEL \! $RS \t [${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]] \[\033[01;34m\]\W \[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w \T \a\]$PS1"
    ;;
  *)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi


# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias gco="git checkout"
alias gcm="git commit -m"
alias gcp="git commit --patch"
alias gcma="git commit -a -m"
alias gm='git mergetool'
alias gra="git rebase --abort"
alias grc='git rebase --continue'
alias grhh='git reset --hard HEAD'
alias gcomb='git checkout origin/master -b'
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gd='git diff'
alias gl='git log'
alias gf='git fetch'
alias gsu='git submodule update --recursive'
alias am='gh pr edit --add-label "automerge" --add-assignee @me'

alias common='cd ~/git/iris_firmware/common'
alias laser='cd ~/git/iris_firmware/laser_v70/luminar'
alias system='cd ~/git/iris_firmware/system_v70/firmware/src/luminar'
alias autosar='cd ~/git/iris_firmware/source_iris_autosar_common'
alias pr='cd ~/git/iris_firmware/hydra/pp/applications/datapath_pr'
alias pl='cd ~/git/iris_firmware/tools/plot_CSV_from_PCAP/python'
alias vis='cd ~/git/iris_firmware/tools/scripts/'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# set a terminal title if the SET_TITLE variable is set
function set-title() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}
if [ ! -z "$SET_TITLE" ]; then
  set-title $SET_TITLE;
  export SET_TITLE=;
fi

fixlfs ()
{
    git lfs uninstall;
    git reset --hard;
    git lfs install;
    git lfs pull;
    git rm --cached -r .;
    git reset --hard;
    git rm .gitattributes;
    git reset .;
    git checkout .
}

# hydra tools
export HYDRA_TOOLS_PATH=$HOME/git/iris_firmware/hydra/tools
source $HOME/git/iris_firmware/hydra/scripts/setup-env.sh 1>/dev/null
export XILINX_VIVADO=/tools/Xilinx/Vivado/2022.1
export PATH="$PATH:"/tools/Xilinx/Vivado/2022.1
export BUILDKITE_GRAPHQL_TOKEN=bkua_a62ee8b856c500941418f69caa0d66488fb332ff
export ARTIFACTORY_TOKEN=cmVmdGtuOjAxOjE3MTIxNjExODQ6NWtGMXJGaGl6Y0llZU5mMmZObzRTRFZuaW82
source /tools/Xilinx/Vivado/2022.1/settings64.sh

##------------------------------------------------------------------------------------------
## Synopsys variables
##------------------------------------------------------------------------------------------
export LM_LICENSE_FILE="27020@10.0.7.22"
export SNPSLMD_LICENSE_FILE=$LM_LICENSE_FILE
export SYNOPSYS="/usr/synopsys"
export VCS_HOME="$SYNOPSYS/vcs/P-2019.06-SP1"
export VERDI_HOME="$SYNOPSYS/verdi/P-2019.06-SP1"
export SCL_HOME="$SYNOPSYS/scl/2018.06-SP1/linux64"
export VC_STATIC_HOME="$SYNOPSYS/vc_static/P-2019.06-SP1"
export SPYGLASS_BASE="$SYNOPSYS/vc_static/P-2019.06-SP1"
export SPYGLASS_HOME="$SPYGLASS_BASE/SG_COMPAT/SPYGLASS_HOME"
export SYN_PATH="$SCL_HOME/bin:$VCS_HOME/bin:$VERDI_HOME/bin:$SPYGLASS_BASE/bin:$SPYGLASS_HOME/bin"
export FPGA_DIR="$HOME/git/iris_firmware/fpga"
alias installer="/usr/synopsys/installer/installer -gui"
alias lic="lmstat -a -c /usr/synopsys/Synopsys_Key_Site_43042_Server_304723_snpslmd.lic"
alias mip=fpga__build_ip

export PATH="$PATH:$SYN_PATH"

function fpga__build_ip {
  cd ${FPGA_DIR}/common/ip;
  make;
  cd -;
  cd ${FPGA_DIR}/slim_v2_primary/ip;
  make;
  cd -;
  cd ${FPGA_DIR}/slim_v2_secondary/ip;
  make;
  cd -;
}
