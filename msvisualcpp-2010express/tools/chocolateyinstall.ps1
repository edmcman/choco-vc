$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://archive.org/download/vs-2010-express-1/VS2010Express1.iso'

$iso = "$env:temp\$packageName.iso"
Get-ChocolateyWebFile -PackageName "$packageName" -FileFullPath "$iso" -Checksum "4B9A07CC14FF93DD5ADAE24FB672A7CCC769F03A6ABECCBFD936827CC2CC3F3D1913E4CFF22E34E318442B0A048B47BF1A374DF4EF85AF72406282B06284B0B4" -ChecksumType sha512 -Url "$url"

Mount-DiskImage -ImagePath $iso

#Get the drive letter where iso is mounted
$driveLetter = (Get-DiskImage $iso | Get-Volume).DriveLetter

# Run commands against the mounted ISO, in this case, run the setup.exe
Install-ChocolateyInstallPackage "$packageName" 'exe' "/q /norestart /log $env:temp\vs.log" "${driveLetter}:\wdexpress_full.exe"

# Unmount the ISO file when finished
Dismount-DiskImage -ImagePath $iso
