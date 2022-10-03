$moduleName = "RobGit"

$manifest = Import-PowerShellDataFile .\RobGit.psd1 
[version]$version = $manifest.ModuleVersion

$installPaths = $env:PSModulePath -split ';'
Write-Host "Where do you want to install $moduleName" "?"
$choseNumer = 0;
foreach ($path in $installPaths)
{
  Write-Host "$choseNumer - $path"
  $choseNumer++
}
Write-Host "Deside by providing the number for the path"
$pathNumber = Read-Host

$installPath = Join-Path $installPaths[$pathNumber] $moduleName $version 
Write-Host "Installing to path: $installPath"
Copy-Item -Path "$PSScriptRoot\*" -Destination $installPath
Write-Host "Done!"

Write-Host "Adding module import to powershell profile $profile"
Add-Content -Path $profile -Value "Import-Module -Name $moduleName -DisableNameChecking" -Force