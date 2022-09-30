function RobGitCheckCurrentBranchIsMainBranch {
    $currentBranch = git rev-parse --abbrev-ref HEAD
 
    $headBranch = (git remote show origin) -match 'HEAD branch:' -replace 'HEAD branch: '
    $headBranch = $headBranch -replace '\s',''

    return $currentBranch -like $headBranch
}

Export-ModuleMember -Function RobGitCheckCurrentBranchIsMainBranch