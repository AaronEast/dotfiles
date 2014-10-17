# Set up additional paths
MY_PATHS="${HOME}/.bin"
for path in ${MY_PATHS}; do
  if [[ :$PATH: == *:${path}:* ]]; then
    continue
  else
    test -d ${path} && PATH=${PATH}:${path}
  fi
done

LANG="en_US.UTF-8"
export LANG

# source custom stuff
source ~/.bash_functions
source ~/.alias_export

# verify vim temp dir
vim_tmp_dir="${HOME}/.tmp"
if [[ ! -d ${vim_tmp_dir} ]]; then
  /bin/mkdir -p ${vim_tmp_dir}
fi

# make bash quiet... damn bell
set bell-style none

# bits and pieces
MY_HOSTNAME=`hostname -s`

# Turn on bash completion if available
if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi
