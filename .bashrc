

shopt -s checkwinsize
export PS1="\[\e[0;31m\]\u\[\e[m\]@\h \[\e[1;32m\]\W\[\e[m\] \[\e[1;31m\]|\[\e[m\] "

LS_COLORS='*_test.py=31:di=94:fi=0:ln=102;90:or=33:mi=103;33:ex=92;40:*.pyc=90:*.o=90:*.d=90:*.py=36:*.c=36:*.h=93:*_test.py=31'

alias ls='ls --color=auto'
alias appserver='python ~/projects/google_appengine/dev_appserver.py'
alias appcfg='python ~/projects/google_appengine/appcfg.py'

ff()
{
    if [ $# -lt 1 ]
    then
        echo "find . -not -path \"*.svn*\" -exec grep --color=auto -In \"<search term>\" '{}' \; -print"
        return
    fi
    find . -path "*datahub/build" -prune -o -not -path "*.svn*" -exec grep --color=auto -In "$*" '{}' \; -print
}

fu()
{
    if [ $# -ne 1 ]
    then
        echo "echo |gawk '{print strftime(\"%a %b %e %T %Z %Y\", <UNIX TIMESTAMP>)}'"
        return
    fi
    echo |gawk "{print strftime(\"%a %b %e %T %Z %Y\", $1)}"
}

up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

rvm use 1.9.2 >> /dev/null