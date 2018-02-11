$ErrorActionPreference = 'Stop';

$packageName= 'lenovo-thinkvantage-system-update'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.lenovo.com/pccbbs/thinkvantage_en/systemupdate5.07.0070.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'Lenovo System Update'
  checksum      = '0add129e812bfd2779d5f1d86909b88fc949f12bb51c040fed4134655dac8045'
  checksumType  = 'sha256'
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs