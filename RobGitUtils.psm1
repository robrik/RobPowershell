function RobGitCheckCurrentBranchIsMainBranch {
    $currentBranch = git rev-parse --abbrev-ref HEAD
    $headBranch = (git remote show origin) -match 'HEAD branch:' -replace 'HEAD branch: '
    return $currentBranch -eq $targetBranch
}

Export-ModuleMember -Function RobGitCheckCurrentBranchIsMainBranch