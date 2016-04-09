# ~/.bashrc: executed by bash(1) for non-login shells.

export EMAIL=robin.schaufler@oracle.com
export REPLYTO=robin.schaufler@oracle.com
export EDITOR=/usr/bin/vim

# The *_proxy environment variables don't influence web browsers.
# On Ubuntu, go to System Settings > Network > Network proxy.
#
# Different theories of proxy settings have been recommended over time.
#
# export https_proxy="http://www-proxy.us.oracle.com:80"
# export http_proxy="http://www-proxy.us.oracle.com:80"
#
# export https_proxy="http://adc-proxy.us.oracle.com:80"
# export http_proxy="http://adc-proxy.us.oracle.com:80"
# export http_proxy="ftp://adc-proxy.us.oracle.com:80"
#
# System Settings > Network > Network proxy:
# Method: Automatic, ConfigurationURL: http://wpad/wpad.dat
# Method: Automatic, ConfigurationURL: http://wpad.us.oracle.com/wpad.dat
#
# Also, the System Settings > Network > Network proxy gui has no setting for no_proxy,
# but I don't know how to set environment variables to be automatic.
export no_proxy="localhost,127.0.0.0/8,127.0.0.1,,127.0.1.1,127.0.1.1*,*.oracle.com,*.us.oracle.com,*.oraclecorp.com,local.home"

export JAVA_HOME=/Apps/jdk1.8.0_60
export ORACLE_HOME=/Apps/Oracle
export MIDDLEWARE_HOME=/Apps/Oracle/Middleware
export WL_HOME=$MIDDLEWARE_HOME/Oracle_Home
export INSTANTCLIENT_HOME=/Apps/instantclient/instantclient_12_1
export LD_LIBRARY_PATH=$ORACLE_HOME
export ANT_HOME=/Apps/apache-ant-1.8.2
#export ANT_OPTS="-Xmx512m -Xss1m"
export ANT_OPTS="-XX:PermSize=1024m -XX:MaxPermSize=2048m"
export SQLDEVELOPER_HOME=/Apps/sqldeveloper/sqldeveloper
export WLS_DOMAIN_NAME=primavera
export USER_HOME=/home/robinschaufler
export PATH=/Apps/instantclient/instantclient_12_1:$WL_HOME/user_projects/domains/$WLS_DOMAIN_NAME::$JAVA_HOME/bin:$ANT_HOME/bin:$USER_HOME/bin:$PATH
# for remoting Java application from Xming on windows
export AWT_TOOLKIT=MToolkit
unset GNOME_DESKTOP_SESSION_ID

export REPO_HOME=$USER_HOME/Dev/pgbu_platform-2.0
export HG_HOME=$USER_HOME/Dev/pgbu_platform-2.0

MARIADB_ROOT_PW=password

#TODO remove export of WL_HOME when debug is complete
export WL_HOME=$MIDDLEWARE_HOME/Oracle_Home
function debugWebLogic () { \
  WL_OPTIONS= ; \
  WL_ARGS=() ; \
  for a in "$@" ; do \
    if [[ $a == "skipdb" || $a == "-skipdb" ]] ; then \
      WL_OPTIONS="-DskipDBBoot=1" ; \
    else \
      WL_ARGS+=($a) ; \
    fi \
  done ; \
  JAVA_DEBUG_OPTIONS='-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=1044 -Xnoagent -Djava.compiler=NONE' ; \
  JAVA_SIZE_OPTIONS='-Xms768m -Xmx1024m -XX:PermSize=768m -XX:MaxPermSize=768m' ; \
  JAVA_LOG_OPTIONS='-Dlog4j.configurationFile=file:/home/robinschaufler/Dev/log4j2.xml' ; \
  JAVA_WORKAROUND_OPTIONS='-Dcsrfenabled=false'; \
  export JAVA_OPTIONS="${JAVA_DEBUG_OPTIONS} ${JAVA_WORKAROUND_OPTIONS} ${JAVA_SIZE_OPTIONS} ${JAVA_LOG_OPTIONS} ${WL_OPTIONS}" ; \
  $WL_HOME/user_projects/domains/primavera/startWebLogic.sh "${WL_ARGS[@]}" ; \
}
function isWlUp () { \
  APP_URL=http://localhost:7001/primavera \
  PROXY=--no-proxy \
  wget -S --spider $PROXY -O /dev/null $APP_URL >/dev/null 2>&1 ; \
  if [[ "$?" -eq 0 ]] ; then \
    echo "1" ; \
  else \
    echo "0" ; \
  fi \
}
function waitForWl () { \
  while [[ ! $(isWlUp) ]] ; do \
    sleep 3 ; \
  done ; \
  notify-send "WebLogic is up" ; \
}
function ants () { \
  echo $REPO_HOME ; \
  skipopts=() ; \
  antopts=() ; \
  options=() ; \
  while [[ $1 ]] ; do \
    case "$1" in \
      -skip) \
        if [[ "$2" == "db" ]] ; then \
          if [[ -f $REPO_HOME/snapshots/dbboot.jar ]] ; then \
            skipopts+=("$2") ; \
          fi \
        else \
          skipopts+=("$2") ; \
        fi ; \
        shift 2 \
        ;; \
      *) \
        options+=("$1") ; \
        shift \
        ;; \
    esac \
  done ; \

  echo skip "${skipopts[@]}" ; \

  for sk in "${skipopts[@]}" ; do \
    antopts+=(-Dskip-"${sk}"=true) ; \
  done ; \

  echo opt "${options[@]}" ; \

  ant "${antopts[@]}" "${options[@]}" && notify-send "Build Completed" ; \

}

[[ -s $USER_HOME/.nvm/nvm.sh ]] &&. $USER_HOME/.nvm/nvm.sh # This loads nvm
