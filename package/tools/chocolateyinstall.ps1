# lenovo-system-update install

$ErrorActionPreference = 'Stop';

$toolsDir              = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$PackageParameters     = Get-PackageParameters
$urlPackage = 'https://download.lenovo.com/pccbbs/thinkvantage_en/system_update_5.07.0097.exe'
$checksumPackage = 'a19f53d2088b9bcf09b150a1eb7d8d4c550d9b9a42204c12a623bc53cdc9016d61497109a064816616c878b1952ce5a02b02db5c73a34d5bbb8e79903467a852'
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
