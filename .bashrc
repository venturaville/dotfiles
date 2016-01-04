export EDITOR="/usr/bin/vim"
set -o vi

# Add element to prompt statement for listing current git branch
function parse_git_branch {
  GIT_BRANCH=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ -n "${GIT_BRANCH}" ] ; then
    echo ":<git:${GIT_BRANCH}>"
  fi
}
# Add element to prompt statement for listing the current AWS account
function parse_aws_account {
  if [ -n "${AWS_ACCOUNT}" ] ; then
    echo ":<aws:${AWS_ACCOUNT}>"
  fi
}
# Modify the prompt statement to give additional context (and colorization where possible)
function promptcommand {
  EXITSTATUS="$?"
  RED="\[\033[01;31m\]"
  GREEN="\[\033[01;32m\]"
  YELLOW="\[\033[01;33m\]"
  PURPLE="\[\033[01;35m\]"
  BLUE="\[\033[01;34m\]"
  OFF="\[\033[00m\]"
  if [ "$EXITSTATUS" -eq "0" ]; then
    EXIT_PS_STRING="0"
  else
    EXIT_PS_STRING="${RED}${EXITSTATUS}${OFF}"
  fi
  
  if [ "$color_prompt" = yes ]; then
    PS1="${debian_chroot:+($debian_chroot)}${GREEN}\u@\h${OFF}:${BLUE}\w${OFF}${YELLOW}\$(parse_git_branch)${OFF}${PURPLE}\$(parse_aws_account)${OFF}:${EXIT_PS_STRING}:\$ "
  else
    PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$(parse_git_branch)\$(parse_aws_account):${EXITSTATUS}:\$ "
  fi
}
PROMPT_COMMAND=promptcommand
