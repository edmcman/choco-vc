# Overview

This project contains source files to create
[Chocolatey](https://chocolatey.org/) packages for historical versions
of Visual C++ and Visual Studio.

# Todo

- [x] Figure out how to integrate
    [GitVersion](https://gitversion.readthedocs.io/en/latest/input/docs/build-server-support/build-server/azure-devops/)
    with the chocolatey build
- [ ] Can maybe use MSVC build tools 2019 for VS 2015, 2017, and 2019

# Developer manual

- `release` branch will be pushed to chocolatey
- PRs to `release` will update the azure artifacts repository so package can be tested
