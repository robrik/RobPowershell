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
2. Have a "RobGitAzureConfig.json" present in the root of your git repo. <br />
   This can be created with "RobGitAzureCreateConfig" but you will have to fill it with your Azure Devops details.

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

Can be used to create a PR in Azure Devops if:

1. Your current branch is a feature branch (Not HEAD branch)
2. All changes are committed and pushed to the remote.

Call with one argument, like:<br />
RobGitCreateAzurePullRequest "commit-message"

### RobGitAzureFastPr

Can be used to create a PR in Azure Devops if:

1. Your current branch is HEAD

Call with two arguments:<br />
RobGitAzureFastPr "tempBranchName" "Commit message"

The command will:

1. Create temp branch
2. Make a commit with all you changes
3. Push temp branch to origin
4. Use "RobGitCreateAzurePullRequest" to create a PR
5. Checkout HEAD
6. Delete temp branch locally
