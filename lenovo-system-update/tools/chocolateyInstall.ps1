# lenovo-system-update install

$ErrorActionPreference = 'Stop';

$urlPackage            = 'https://download.lenovo.com/pccbbs/thinkvantage_en/systemupdate5.07.0072.exe'
$checksumPackage       = 'c46cda169f952c5518a63f2402f18e6100e459bad0ac2f0ed513f8578329bff5cab62925ea20e362451381670ba83c9f4544c66d7d6a75c6146ea555884bfd6f'
$checksumTypePackage   = 'SHA512'
$checksumPackage64     = 'c46cda169f952c5518a63f2402f18e6100e459bad0ac2f0ed513f8578329bff5cab62925ea20e362451381670ba83c9f4544c66d7d6a75c6146ea555884bfd6f'
$checksumTypePackage64 = 'SHA512'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'EXE'
    url            = $urlPackage
    checksum       = $checksumPackage
    checksumType   = $checksumTypePackage
    checksum64     = $checksumPackage64
    checksumType64 = $checksumTypePackage64
    silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
