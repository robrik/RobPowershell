function Rob-Git-Create-Azure-PullRequest {
  param(
         [Parameter(Mandatory)]
         [string]$commitMessage
     )

    $currentBranch = git rev-parse --abbrev-ref HEAD

    $project = "Customer analysis (Hedda - Selma)"
    $repository = "Digital Services"
    $autoComplete = 'true'
    $deleteSourceBranch = 'true'
    $squash = 'true'
    
    $rawTargetBranch = git symbolic-ref refs/remotes/origin/HEAD
    $targetBranch = $rawTargetBranch.Substring($rawTargetBranch.LastIndexOf('/') + 1)

    $title = "Merge from $currentBranch into $targetBranch - $commitMessage"

    az repos pr create --org https://dev.azure.com/MartinServera/ --project $project --repository $repository --auto-complete $autoComplete --delete-source-branch $deleteSourceBranch --squash $squash --source-branch $currentBranch --target-branch $targetBranch --title $title --merge-commit-message $commitMessage --draft false --output table
 }

Export-ModuleMember -Function Rob-Git-Create-Azure-PullRequest

