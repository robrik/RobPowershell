Import-Module -Name $PSScriptRoot\RobGitUtils.psm1

function RobGitGetAzureConfig {
param(
          [Parameter(Mandatory)]
          [string]$filePath
     )
    $config = Get-Content "$filePath\RobGitConfigAzure.json" | ConvertFrom-Json
    return $config
}

Export-ModuleMember -Function RobGitGetAzureConfig