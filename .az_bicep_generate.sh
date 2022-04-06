# to extend a command, start with a function that has the same name as the command
function az() {
  # check only for the arguments that we want to extend
  if [[ ${1} == "bicep" && ${2} == "generate" ]]; then

  fi
}
