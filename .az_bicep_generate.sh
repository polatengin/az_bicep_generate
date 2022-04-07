# to extend a command, start with a function that has the same name as the command
function az() {
  if [[ ${1} == "bicep" && ${2} == "--help" ]]; then
    # get output of `az bicep --help` command
    local output=$(command az bicep --help)

    # command description that will added to `--help` text
    local _command_usage="Commands:\n    generate      : Generate bicep file from te existing Resource Group."

    # replace `Commands:` with `Commands:` and command description
    echo -e "${output/Commands:/${_command_usage}}"

    # return from the function
    return 0
  fi

  # check only for the arguments that we want to extend
  if [[ ${1} == "bicep" && ${2} == "generate" ]]; then

    # if required arguments are present, execute the command
    if [[ ${3} == "--resource-group" || ${3} == "-n" ]]; then

      # default filename is the resource group name
      local FILE_NAME="${4}"

      # if the filename is not provided, use the given name
      if [[ ${5} == "--output-file" || ${5} == "-f" ]]; then
        FILE_NAME="${6}"
      fi

      # if extension is not provided, use the `.bicep` extension
      if [[ ${FILE_NAME} != *".bicep" ]]; then
        FILE_NAME="${FILE_NAME}.bicep"
      fi

      # export the resource group to the temp file
      az group export --name "${4}" > "/tmp/${4}.json"

      # generate the bicep file from the temp file
      az bicep decompile --file "/tmp/${4}.json"

      # remove the temp file
      rm -f "/tmp/${4}.json"

      # move the bicep file to the desired location
      mv "/tmp/${4}.bicep" "./${FILE_NAME}"
    # if required arguments are not present, print the usage message
    else
      echo "Usage: az bicep generate --resource-group <resource-group-name> [--output-file <file-name>]";
    fi
    
    # return from the function
    return 0
  fi

  # if the command is not the one we want to extend, pass all the arguments to the command
  command az "$@"
}
