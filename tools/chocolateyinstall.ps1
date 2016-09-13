$ErrorActionPreference = 'Stop';

$packageName= 'lenovo-thinkvantage-system-update'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.lenovo.com/pccbbs/thinkvantage_en/systemupdate5.07.0032.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'Lenovo System Update'
  checksum      = '55b89dec2edcd7c3f330644098cab758484411ef6f5056e9742440c779b7f800'
  checksumType  = 'sha256'
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs