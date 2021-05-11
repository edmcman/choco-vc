$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://download.microsoft.com/download/7/2/E/72E0F986-D247-4289-B9DC-C4FB07374894/VS2013_RTM_DskExp_ENU.iso'

Get-ChocolateyWebFile -PackageName "$packageName" -FileFullPath "$env:temp\$packageName.iso" -Checksum "C655554D3CA62DC2105A146EFB4FD3BAE3237FF1CBB38667C3FE1CBFB9C0D950A3BD88DEBDFAAE6F6475C4A647EA41361F3D3426E7762A50A62FC174E70C1381" -ChecksumType sha512 -Url "$url"
imdisk -a -f "$env:temp\$packageName.iso" -m "w:"
Install-ChocolateyInstallPackage "$packageName" 'exe' "/q /norestart /log $env:temp\vs.log" 'w:\wdexpress_full.exe'
imdisk -D -m w: