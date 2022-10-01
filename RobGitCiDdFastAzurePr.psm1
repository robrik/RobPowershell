
function RobGitCiDdFastAzurePr {
  param(
         [Parameter(Mandatory)]
         [string]$branchName
          [Parameter(Mandatory)]
         [string]$commitMessage
     )


    if(!RobGitCheckCurrentBranchIsMainBranch()) {
        Write-Host "Can only use fast PR from main branch"
        return;
      }

    $fastPrBranchName = FPR/$branchName
    $headBranch = RobGitGetHeadBranchName()
    $currentPath = pwd
    $gitRoot = git rev-parse --show-toplevel

    Write-Host "Moving to $gitRoot"
    cd $gitRoot
    Write-Host "Moving to branch: $fastPrBranchName"
    git checkout -b $fastPrBranchName
    Write-Host "Adding all files"
    git add .
    Write-Host "Creating commit"
    git commit -m $commitMessage
    Write-Host "Push branch to remote"
    git push --set-upstream origin $fastPrBranchName
    Write-Host "Creating PR"
    RobGitCreateAzurePullRequest($commitMessage)
    Write-Host "Moving back to $headBranch"
    git checkout $headBranch
    Write-Host "Moving back to $currentPath"
    cd $currentPath
}


Export-ModuleMember -Function RobGitCiDdFastAzurePr


