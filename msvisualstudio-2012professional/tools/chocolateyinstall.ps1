$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.microsoft.com/download/D/E/8/DE8E42D8-7598-4F4E-93D4-BB011094E2F9/VS2012_PRO_enu.iso?WT.mc_id=DT-MVP-5003202'

Get-ChocolateyWebFile -PackageName "$packageName" -FileFullPath "$env:temp\$packageName.iso" -Checksum "55BD247FB005CFB2EC28339EF471EE485AE7AF15B6BE817CA8C57A8553F9ECE7B231BF725770BAD1B6EA5157DF48FEFCDE66D7CE87A8DD22EC5E16337743941D" -ChecksumType sha512 -Url "$url"
imdisk -a -f "$env:temp\$packageName.iso" -m "w:"
Install-ChocolateyInstallPackage "$packageName" 'exe' "/q /norestart /log $env:temp\vs.log" 'w:\vs_professional.exe'
imdisk -D -m w: