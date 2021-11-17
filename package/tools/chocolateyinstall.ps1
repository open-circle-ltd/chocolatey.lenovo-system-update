# lenovo-system-update install

$ErrorActionPreference = 'Stop';

$toolsDir              = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$PackageParameters     = Get-PackageParameters
$urlPackage = 'https://download.lenovo.com/pccbbs/thinkvantage_en/system_update_5.07.0131.exe'
$checksumPackage = '3f1d04ccd50387c6a770d67d39845d8e780b04038ce8a4af07fbf938d5209b5fd995cffa9447486a052a8d20d7da09d3f3dc4dd34b831f1c709286269b7d1705'
$checksumTypePackage = 'SHA512'

Import-Module -Name "$($toolsDir)\helpers.ps1"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'EXE'
    url            = $urlPackage
    checksum       = $checksumPackage
    checksumType   = $checksumTypePackage
    silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs

if ($PackageParameters.CleanStartmenu) {
	Remove-FileItem `
		-Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\lenovo"
  Install-ChocolateyShortcut `
    -ShortcutFilePath "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Lenovo System Update.lnk" `
    -TargetPath "C:\Program Files (x86)\Lenovo\System Update\tvsu.exe" `
    -WorkDirectory "C:\Program Files (x86)\Lenovo\System Update"
}	
