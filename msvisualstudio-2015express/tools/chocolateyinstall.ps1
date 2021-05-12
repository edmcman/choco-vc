$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.my.visualstudio.com/pr/en_visual_studio_express_2015_for_windows_desktop_x86_dvd_cddc01f6.iso?t=981e2fb5-6cf8-4592-bb3e-f30fb6c5b5c8&e=1620866779&h=32d3d7c15444d70b54d3e47ae1c3c09a&su=1"

$iso = "$env:temp\$packageName.iso"
Get-ChocolateyWebFile -PackageName "$packageName" -FileFullPath "$iso" -Checksum "618703727411BE10F06266CA4932A2D9BD3FA9664C069EB1DBA6EC25F22DDE84401DFE23BFCC9ABD419439AC6DA2158A4F8F2A7365E4CF843E8E32A74CA5F184" -ChecksumType sha512 -Url "$url"

Mount-DiskImage -ImagePath $iso

#Get the drive letter where iso is mounted
$driveLetter = (Get-DiskImage $iso | Get-Volume).DriveLetter

# Run commands against the mounted ISO, in this case, run the setup.exe
Install-ChocolateyInstallPackage "$packageName" 'exe' "/q /norestart /log $env:temp\vs.log" "${driveLetter}:\wdexpress_full.exe"

# Unmount the ISO file when finished
Dismount-DiskImage -ImagePath $iso
