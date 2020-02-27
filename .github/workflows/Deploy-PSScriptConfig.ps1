

Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Get-ChildItem /home/runner/work/PSScriptConfig
Import-Module /home/runner/work/PSScriptConfig/PSScriptConfig -Force
$modulePath = (Get-Module PSScriptConfig).path

$nuGetApiKey = $env:PSGALLERY_TOKEN

try{
    Publish-Module -Path $modulePath -NuGetApiKey $nuGetApiKey -ErrorAction Stop -Force
}
catch {
    throw $_
}