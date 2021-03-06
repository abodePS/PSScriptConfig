$modulePath = "/home/runner/work/PSScriptConfig/PSScriptConfig/main/PSScriptConfig"
$nuGetApiKey = $env:PSGALLERY_TOKEN



# Get-PSRepository -Name psgallery |Set-PSRepository -InstallationPolicy Trusted

# #Install current version from PSGallery
# Install-Module -Name PSScriptConfig -Force
# Import-Module PSScriptConfig -Force
# [version]$version = (Get-Module -Name PSScriptConfig).Version


#Generate new version
# [version]$newVersion = "{0}.{1}.{2}" -f $version.Major, $version.Minor, ($version.Build +1)

Set-Location '/home/runner/work/PSScriptConfig/PSScriptConfig/main'
[version]$newVersion = (git tag | tail -1) -replace 'v'


Update-ModuleManifest -Path (Join-Path $modulePath -ChildPath "PSScriptConfig.psd1") -ModuleVersion $newVersion


try{
   Publish-Module -Path $modulePath -NuGetApiKey $nuGetApiKey -ErrorAction Stop -Force
}
catch {
    throw $_
}