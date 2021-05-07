$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.microsoft.com/download/E/8/E/E8EEB394-7F42-4963-A2D8-29559B738298/VS2008ExpressWithSP1ENUX1504728.iso'

Get-ChocolateyWebFile -PackageName "$packageName" -FileFullPath "$env:temp\$packageName.iso" -Checksum "DBEBC84C35435C2B5D33F61D9A269D56C100FDDC8BDB63D3456CB05666B75013544E04DD903E27619938D25F90E18A8FAA17895055B1402CB3FAA7B4F292C172" -ChecksumType sha512 -Url "$url"
imdisk -a -f "$env:temp\$packageName.iso" -m "w:"
Install-ChocolateyInstallPackage "$packageName" 'exe' '/qb /norestart /log $env:temp\vs.log' 'w:\VCExpress\setup.exe'
imdisk -d -m w: