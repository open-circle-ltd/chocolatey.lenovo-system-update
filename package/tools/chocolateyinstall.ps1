# lenovo-system-update install

$ErrorActionPreference = 'Stop';

$toolsDir              = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$PackageParameters     = Get-PackageParameters
$urlPackage = 'https://download.lenovo.com/pccbbs/thinkvantage_en/system_update_5.07.0084.exe'
$checksumPackage = '46d9085f7f44fbcf1e015dd46aba87e878a418e0363303299deb491afd1f1bd5f66ae980753b5ccfdc11c5792896264bab1c983505dfc85a66567a757655653d'
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
