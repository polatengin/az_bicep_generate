# az_bicep_generate

add bicep generate sub-command to azure cli (az) tool

## usage

Source the bash script file `.az_bicep_generate.sh` in your current shell.

```bash
. .az_bicep_generate.sh
```

It can be automatically sourced by adding the following to your `.bashrc` file:

```bash
. .az_bicep_generate.sh
```

To generate a `bicep` file from the existing Azure Resource Group, run the following command:

```bash
az bicep generate --resource-group-name <resource-group-name> --output-file <output-file>
```

If `--output-file` argument is not specified, the `bicep` file will be generated with the Resource Group name, for example:

```bash
az bicep generate --resource-group-name rg-test
```
