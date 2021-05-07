$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://archive.org/download/vs-2010-express-1/VS2010Express1.iso'

Get-ChocolateyWebFile -PackageName "$packageName" -FileFullPath "$env:temp\$packageName.iso" -Checksum "4B9A07CC14FF93DD5ADAE24FB672A7CCC769F03A6ABECCBFD936827CC2CC3F3D1913E4CFF22E34E318442B0A048B47BF1A374DF4EF85AF72406282B06284B0B4" -ChecksumType sha512 -Url "$url"
imdisk -a -f "$env:temp\$packageName.iso" -m "w:"
Install-ChocolateyInstallPackage "$packageName" 'exe' '/q /norestart /log $env:temp\vs.log' 'w:\VCExpress\setup.exe'
imdisk -d -m w: