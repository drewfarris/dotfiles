
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagacad

# Java and friends
if [ $(uname) == "Darwin" ]; then
  export JAVA_HOME=/Library/Java/Home # mac
else
  export JAVA_HOME=/usr/java/default # redhat/centos
fi

export MAVEN_OPTS="-Xmx512m -Xms256m -XX:PermSize=128m -XX:MaxPermSize=256m -Dfile.encoding=UTF-8"
export MAVEN_OPTS_DEBUG="${MAVEN_OPTS} -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=8781,server=y,suspend=n"

export ANT_OPTS="-Xms512M -Xmx2048M -Xss1M -XX:MaxPermSize=128M"

# git
source ~/.bash_completion.d/git-completion.bash
source ~/.bash_completion.d/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\e[1;32m\]\u@\h \[\e[1;33m\]\w\[\e[0m\]$(__git_ps1 " (%s)")\n\$ '

# other completion scripts
source ~/.bash_completion.d/mvn-completion.bash
source ~/.bash_completion.d/svn-completion.bash

export PATH="${JAVA_HOME}/bin:/usr/local/bin:$PATH:/usr/local/sbin"

alias tar="COPYFILE_DISABLE=true tar" # we don't need ._ files everywhere on a mac, see http://www.commandlinefu.com/commands/view/5965/create-.tar-file-on-mac-os-x-leopard-snow-leopard-without-._-files
alias edb="export EMISSARY_DBG_OPTIONS=\"-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005\""
alias noedb="unset EMISSARY_DBG_OPTIONS"
alias magit='emacsclient -a emacs -e "(magit-status \"$(pwd)\")"'

#history stuff
shopt -s histappend
PROMPT_COMMAND='history -a'
shopt -s cdspell
export HISTCONTROL="ignoredups"
export HISTIGNORE="&:ls:[bf]g:exit"
shopt -s cmdhist

# standalone hadoop-1.0.4
#export HADOOP_PREFIX=/opt/hadoop-1.0.4
#export PATH="${HADOOP_PREFIX}/bin:${PATH}"

# rbenv stuff
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
