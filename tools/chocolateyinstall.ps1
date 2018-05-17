$ErrorActionPreference = 'Stop';

$packageName= 'lenovo-thinkvantage-system-update'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.lenovo.com/pccbbs/thinkvantage_en/systemupdate5.07.0072.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'Lenovo System Update'
  checksum      = 'fef88d1a4728b6e766064c4c27a363aff37847dc0ae47ee0146f2ceba48e5d7c'
  checksumType  = 'sha256'
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs