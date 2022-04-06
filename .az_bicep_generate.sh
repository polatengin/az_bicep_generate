# to extend a command, start with a function that has the same name as the command
function az() {
  # check only for the arguments that we want to extend
  if [[ ${1} == "bicep" && ${2} == "generate" ]]; then

    # if required arguments are present, execute the command
    if [[ ${3} == "--resource-group" || ${3} == "-n" ]]; then

    # if required arguments are not present, print the usage message
    else
      echo "Usage: az bicep generate --resource-group <resource-group-name> [--output-file <file-name>]";
    fi
  # if the command is not the one we want to extend, pass all the arguments to the command
  else
    command az "$@"
  fi
}
