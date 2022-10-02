Import-Module -Name $PSScriptRoot\RobGitAzureUtils.psm1
Import-Module -Name $PSScriptRoot\RobGitUtils.psm1

function RobGitCreateAzurePullRequest {
  param(
         [Parameter(Mandatory)]
         [string]$commitMessage
     )

    $config = RobGitGetAzureConfig(RobGitGetRepositoryRoot)
    if(!$config)
    {
      Write-Host "Could not find config file!"
    }

    $org = $config.org
    $project = $config.project
    $repository = $config.repository
    $autoComplete = $config.autoComplete
    $deleteSourceBranch = $config.deleteSourceBranch
    $squash = $config.squash

    $currentBranch = RobGitGetCurrentBranchName
    $targetBranch = RobGitGetHeadBranchName

    if(!$targetBranch)
    {
      Write-Host "Could not find a remote repository!"
    }

    $title = "Merge from $currentBranch into $targetBranch - $commitMessage"

    az repos pr create --org $org --project $project --repository $repository --auto-complete $autoComplete --delete-source-branch $deleteSourceBranch --squash $squash --source-branch $currentBranch --target-branch $targetBranch --title $title --merge-commit-message $commitMessage --draft false --output table
 }

Export-ModuleMember -Function RobGitCreateAzurePullRequest

