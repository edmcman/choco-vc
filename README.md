# Overview

This project contains source files to create
[NuGet](https://www.nuget.org/) packages for historical versions of
Visual C++ and Visual Studio.  The original goal was to publish
packages to [Chocolatey](https://chocolatey.org/), but this ultimately
seemed like extra, unneeded work.  The packages are available in this
[NuGet
repository](https://pkgs.dev.azure.com/edmcman/choco-vc/_packaging/choco-vc@Local/nuget/v2).

This repository was created primarily to support
[BuildExes](https://github.com/sei-eschwartz/buildexes), a project
that builds executables using many versions of Visual C++.  Many of
the packages on Chocolatey for older versions of Visual C++ no longer
work because Microsoft (intentionally) broke the web installers as a
consequence of [phasing out
SHA1](https://developercommunity.visualstudio.com/t/old-visual-studio-web-installers-no-longer-functio/1409036?from=email).

## Quick start

You can install the packages with [Chocolatey](https://chocolatey.org/):

- `choco source add -n=msvc -s "https://pkgs.dev.azure.com/edmcman/choco-vc/_packaging/choco-vc@Local/nuget/v2"`
- `choco install --timeout 0 --pre -y <packagename>`

# Todo

- [x] Figure out how to integrate
    [GitVersion](https://gitversion.readthedocs.io/en/latest/input/docs/build-server-support/build-server/azure-devops/)
    with the chocolatey build
- [ ] Can maybe use MSVC build tools 2019 for VS 2015, 2017, and 2019
- [ ] Allow workload [customization](https://github.com/jberezanski/ChocolateyPackages/blob/master/visualstudio2017buildtools/visualstudio2017buildtools.nuspec)

# Developer manual

- `release` branch will be pushed to chocolatey
- PRs to `release` will update the azure artifacts repository so
  package can be tested. (I should probably change this)
