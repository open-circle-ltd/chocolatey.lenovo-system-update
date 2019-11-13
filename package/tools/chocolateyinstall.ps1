# lenovo-system-update install

$ErrorActionPreference = 'Stop';

$toolsDir              = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$PackageParameters     = Get-PackageParameters
$urlPackage = 'https://download.lenovo.com/pccbbs/thinkvantage_en/system_update_5.07.0088.exe'
$checksumPackage = 'f8f2fc454b9f5ddc5b63c479e24bd422b3bc1df329760e0d30b92b45360d78a2677ed71e2a17a116e90efc7b29cdef91ff6ef610fd9e5dbebdd40bf79e31beb9'
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
