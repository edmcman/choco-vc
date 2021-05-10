$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.microsoft.com/download/6/e/c/6ec5b3cf-cc0d-448a-9846-8af059de7f72/vs2012_winexp_enu.iso?WT.mc_id=DT-MVP-5003202'

Get-ChocolateyWebFile -PackageName "$packageName" -FileFullPath "$env:temp\$packageName.iso" -Checksum "A6F0666994634FEC4AD39ADF0793E7CDA16241002FA1581DE06ABAF066A9D75600EC91CC4D921667F4005273DEB680CCAF71BD51CAE2BD3C607DD19976775BDB" -ChecksumType sha512 -Url "$url"
imdisk -a -f "$env:temp\$packageName.iso" -m "w:"
gci env:
(gci env:*).GetEnumerator() | Sort-Object Name | Out-String
echo $env:temp\vs.log
Install-ChocolateyInstallPackage "$packageName" 'exe' '/Passive /norestart' 'w:\win8express_full.exe'
imdisk -d -m w: