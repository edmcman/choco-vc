$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://go.microsoft.com/fwlink/?LinkId=615448&clcid=0x409'

$iso = "$env:temp\$packageName.iso"
Get-ChocolateyWebFile -PackageName "$packageName" -FileFullPath "$iso" -Checksum "035E2E7582D2AC8359D9C23991BEA755FEB490C5D01061F397D2C4DF8A68D24B6568E2485646E40F127DAB8543E3FEAA22FC9ABFCE678F0C7D63A242D7C46984" -ChecksumType sha512 -Url "$url"

Mount-DiskImage -ImagePath $iso

#Get the drive letter where iso is mounted
$driveLetter = (Get-DiskImage $iso | Get-Volume).DriveLetter

# Run commands against the mounted ISO, in this case, run the setup.exe

Install-ChocolateyInstallPackage "$packageName" 'exe' "/q /norestart /adminfile ${toolsDir}/admin.xml /log $env:temp\vs.log" "${driveLetter}:\vs_community.exe"

# Unmount the ISO file when finished
Dismount-DiskImage -ImagePath $iso
