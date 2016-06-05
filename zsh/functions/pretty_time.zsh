# function for transform seconds in days, hours...
# @author sindresorhus 
# @github sindresorhus/pretty-time-zsh
#
function pretty_time() {
  if (( $# == 0 )); then
    echo 'Input required'
    exit 1
  fi

  local human total_seconds=$1
  local days=$(( total_seconds / 60 / 60 / 24 ))
  local hours=$(( total_seconds / 60 / 60 % 24 ))
  local minutes=$(( total_seconds / 60 % 60 ))
  local seconds=$(( total_seconds % 60 ))

  (( days > 0 )) && human+="${days}d "
  (( hours > 0 )) && human+="${hours}h "
  (( minutes > 0 )) && human+="${minutes}m "
  human+="${seconds}s"

  echo "$human"
}