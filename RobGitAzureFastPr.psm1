Import-Module -Name $PSScriptRoot\RobGitAzureUtils.psm1
Import-Module -Name $PSScriptRoot\RobGitUtils.psm1

function RobGitAzureFastPr {
  param(
          [Parameter(Mandatory)]
          [string]$branchName,
          [Parameter(Mandatory)]
          [string]$commitMessage
     )


    $isOnHead = RobGitCheckCurrentBranchIsMainBranch
    if(!$isOnHead) {
        Write-Host "Can only use fast PR from main branch"
        return;
      }

    $branchGuid = New-Guid
    $fastPrBranchName = "FPR/$branchName-$branchGuid"
    $headBranch = RobGitGetHeadBranchName
    $currentPath = pwd
    $gitRoot = RobGitGetRepositoryRoot




    Write-Host "Moving to $gitRoot"
    cd $gitRoot
    Write-Host "Creating branch: $fastPrBranchName"
    git checkout -b $fastPrBranchName
    Write-Host "Adding all files"
    git add .
    Write-Host "Creating commit"
    git commit -m $commitMessage
    Write-Host "Push branch to remote"
    git push --set-upstream origin $fastPrBranchName --quiet
    Write-Host "Creating PR"
    RobGitCreateAzurePullRequest($commitMessage)
    Write-Host "Moving back to $headBranch"
    git checkout $headBranch
    Write-Host "Deleting local branch: $fastPrBranchName"
    git branch -D $fastPrBranchName --quiet
}


Export-ModuleMember -Function RobGitAzureFastPr


