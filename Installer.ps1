$moduleName = "RobGit"

$manifest = Import-PowerShellDataFile .\RobGit.psd1 
[version]$version = $manifest.ModuleVersion

$installPaths = $env:PSModulePath -split ';'
Write-Host "Where do you want to install $moduleName" "?"
$pathNumberAlternativ = 0;
foreach ($path in $installPaths)
{
  Write-Host "$pathNumberAlternativ - $path"
  $pathNumberAlternativ++
}
Write-Host "Deside by providing the number for the path"
$pathNumberChoosen = Read-Host

$installPath = Join-Path $installPaths[$pathNumberChoosen] $moduleName $version 
Write-Host "Installing to path: $installPath"
Copy-Item -Path "$PSScriptRoot\*" -Destination $installPath
Write-Host "Done!"

$profileImportCommand = "Import-Module -Name $moduleName -DisableNameChecking"
$importAlreadyPresentInProfile = Select-String -Path $profile -Pattern $profileImportCommand  
if(!$importAlreadyPresentInProfile){
  Write-Host "Adding module import to powershell profile $profile"
  Add-Content -Path $profile -Value $profileImportCommand -Force
}
else{
  Write-Host "Import already present in PS profile"
}

