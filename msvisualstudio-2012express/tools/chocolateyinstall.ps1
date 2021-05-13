$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://download.microsoft.com/download/1/F/5/1F519CC5-0B90-4EA3-8159-33BFB97EF4D9/VS2012_WDX_ENU.iso'

$iso = "$env:temp\$packageName.iso"
Get-ChocolateyWebFile -PackageName "$packageName" -FileFullPath "$iso" -Checksum "516DACC4A5310971532AA37CEC60DFB4DD62993F54D7E787FFC83D6CC4CF78AF244E064AD3C6B7D6F3FA8B21A5BE2D7112F2AE5EC462707F7A12D9123E44BC03" -ChecksumType sha512 -Url "$url"

Mount-DiskImage -ImagePath $iso

#Get the drive letter where iso is mounted
$driveLetter = (Get-DiskImage $iso | Get-Volume).DriveLetter

# Run commands against the mounted ISO, in this case, run the setup.exe
Install-ChocolateyInstallPackage "$packageName" 'exe' "/q /norestart /log $env:temp\vs.log" "${driveLetter}:\wdexpress_full.exe"

# Unmount the ISO file when finished
Dismount-DiskImage -ImagePath $iso
