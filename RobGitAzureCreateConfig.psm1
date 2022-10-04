
function RobGitAzureCreateConfig {
    Copy-Item -Path "$PSScriptRoot\RobGitAzureConfigTemplate.json" -Destination ".\RobGitAzureConfig.json"
}

Export-ModuleMember -Function RobGitAzureCreateConfig