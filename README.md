# RobPowershell
Here you will fine Powershell modules that help you automate developer related tasks. This will grow with my needs to automate daily task.

# How to consume
1. Clone the repo
2. Run the installer.ps1 - This will install the ps modules to the location you choose. It will also add the import of the main module to your powershell profile (if the import dosnt already exists)
3. Use the commands currently there are two: RobGitCreateAzurePullRequest and RobGitAzureFastPr

# Commands
List of currently available commands.
## Azure Devops Commands



For these commands to work you need to
1. Be login to azure with: az login
2. Have a "RobGitAzureConfig.json" present in the root of your git repo.
```json
{
    "org": "",
    "project": "",
    "repository": "",
    "autoComplete": "true",
    "deleteSourceBranch": "true",
    "squash": "true"
}
```


### RobGitCreateAzurePullRequest
TODO

### RobGitAzureFastPr
TODO
