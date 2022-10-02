function RobGitGetCurrentBranchName {
    $currentBranch = git rev-parse --abbrev-ref HEAD
    return $currentBranch
}


function RobGitGetHeadBranchName {
    $headBranch = (git remote show origin) -match 'HEAD branch:' -replace 'HEAD branch: '
    $headBranch = $headBranch -replace '\s',''
    return $headBranch
}

function RobGitCheckCurrentBranchIsMainBranch {
    $currentBranch = RobGitGetCurrentBranchName
    $headBranch = RobGitGetHeadBranchName
    return $currentBranch -like $headBranch
}


function RobGitGetRepositoryRoot {
     $gitRoot = git rev-parse --show-toplevel
     return $gitRoot
}

Export-ModuleMember -Function RobGitGetCurrentBranchName
Export-ModuleMember -Function RobGitGetHeadBranchName
Export-ModuleMember -Function RobGitCheckCurrentBranchIsMainBranch
Export-ModuleMember -Function RobGitGetRepositoryRoot