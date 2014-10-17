#!/bin/bash

function sduo() {
  local _sudo='/usr/bin/sudo'
  local errThang=("$@")
  echo;echo "Learn to spell buddy";echo
  sleep 1
  ${_sudo} ${errThang[@]}
}

function exefind() {
  local _sudo=$(which sudo)
  local _cmd=$(which find)
  local _target=("${@}")

  ${_sudo} ${_cmd} / -type f -perm +111 -name ${_target[@]} -print
}

function exe() {
  /bin/chmod u+x ${1}
}

function bin2dec() 
{
  /bin/echo $((2#${1}))
}

function bin2hex()
{
  /usr/bin/printf '%x\n' "$((2#${1}))"
}

function dec2bin()
{
  echo "obase=2;${1}" | bc
}

function parse_git_branch() 
{
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function fliptable
{
  echo "（╯°□°）╯ ┻━┻";
}

function respecttable()
{
  echo "┬─┬ノ(ಠ_ಠノ)"
}

function fliptable_ru()
{
  echo "ノ┬─┬ノ ︵ ( o°o)"
}

function headers()
{
  _cmd=$(which curl)
  _grep=$(which grep)
  _cut=$(which cut)
  ${_cmd} -sv "$@" 2>&1 >/dev/null | ${_grep} -v "^\*" | ${_grep} -v "^}" | ${_cut} -c3-
}

function testhttps()
{
  local _site="${@}"
  _openssl=$(which openssl)
  $(which clear);${_openssl} s_client -connect "${_site}"
}

function to_json()
{
  $(which cat) - | $(which perl) -MJSON -E 'say to_json(from_json(<>),{utf8 => 1, pretty => 1})'
}

function colors()
{
  local T='gYw'   # The test text

  echo -e "\n                 40m     41m     42m     43m\
       44m     45m     46m     47m";

  for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
             '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
             '  36m' '1;36m' '  37m' '1;37m';
    do FG=${FGs// /}
    echo -en " $FGs \033[$FG  $T  "
    for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
      do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
    done
    echo;
  done
  echo
}

function cmd_metrics()
{
  history | $(which awk) '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | $(which grep) -v "./" | $(which column) -c3 -s " " -t | $(which sort) -nr | $(which nl) |  $(which head) -n${1}
}
