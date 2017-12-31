#!/usr/bin/env zsh

# tinylogger.bash - A simple logging framework for Bash scripts in < 10 lines
# https://github.com/nk412/tinylogger

LOGGER_FMT=${LOGGER_FMT:="%Y-%m-%d %H:%M:%S"}
LOGGER_LVL=${LOGGER_LVL:="info"}

function lg() {
  action=$1 && shift
  case $action in
  debug) [[ $LOGGER_LVL =~ debug ]] && echo "$(date "+${LOGGER_FMT}") - DEBUG - $@" 1>&2 ;;
  info) [[ $LOGGER_LVL =~ "debug|info" ]] && echo "$(date "+${LOGGER_FMT}") - INFO - $@" 1>&2 ;;
  warn) [[ $LOGGER_LVL =~ "debug|info|warn" ]] && echo "$(date "+${LOGGER_FMT}") - WARN - $@" 1>&2 ;;
  error) [[ ! $LOGGER_LVL =~ none ]] && echo "$(date "+${LOGGER_FMT}") - ERROR - $@" 1>&2 ;;
  esac
  true
}
