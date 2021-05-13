$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.microsoft.com/download/E/8/E/E8EEB394-7F42-4963-A2D8-29559B738298/VS2008ExpressWithSP1ENUX1504728.iso'

$iso = "$env:temp\$packageName.iso"
Get-ChocolateyWebFile -PackageName "$packageName" -FileFullPath "$iso" -Checksum "DBEBC84C35435C2B5D33F61D9A269D56C100FDDC8BDB63D3456CB05666B75013544E04DD903E27619938D25F90E18A8FAA17895055B1402CB3FAA7B4F292C172" -ChecksumType sha512 -Url "$url"

Mount-DiskImage -ImagePath $iso

#Get the drive letter where iso is mounted
$driveLetter = (Get-DiskImage $iso | Get-Volume).DriveLetter

# Run commands against the mounted ISO, in this case, run the setup.exe
Install-ChocolateyInstallPackage "$packageName" 'exe' "/q /norestart /log $env:temp\vs.log" "${driveLetter}:\wdexpress_full.exe"

# Unmount the ISO file when finished
Dismount-DiskImage -ImagePath $iso