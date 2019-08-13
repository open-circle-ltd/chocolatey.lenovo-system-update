# Chocolatey Package: Lenovo System Update

[![Build Status](https://img.shields.io/travis/itigoag/chocolatey.lenovo-system-update?style=flat-square)](https://travis-ci.org/itigoag/chocolatey.lenovo-system-update) [![license](https://img.shields.io/github/license/mashape/apistatus.svg?style=popout-square)](licence) [![Chocolatey](https://img.shields.io/chocolatey/v/lenovo-system-update?label=package%20version)](https://chocolatey.org/packages/lenovo-system-update) [![Chocolatey](https://img.shields.io/chocolatey/dt/lenovo-system-update?label=package%20downloads&style=flat-square)](https://chocolatey.org/packages/lenovo-system-update)

## Description

System Update downloads software, driver and BIOS updates from a Lenovo server directly over the Internet without requiring specific user knowledge of where the package is located or if it is needed by the target system.

Other ways in which ThinkVantage Technologies help you keep your system up to date and secure are:

- Provides a direct connection to Lenovo Service and Support for ThinkPad and ThinkCentre drivers, software and BIOS updates.
- Helps maximize your system performance and minimize security vulnerability.

### Supported Systems

ThinkVantage System Update is supported on the following systems:

- Lenovo 3000 C100, C200, N100, N200, V100, V200
- Lenovo 3000 J100, J105, J110, J115, J200, J200p, J205, S200, S200p, S205
- All ThinkPad
- All ThinkCentre
- All ThinkStation
- Lenovo V/B/K/E Series

Note: ThinkPad S440 &amp; S540 does not support Windows 8.1

ThinkVantage System Update will support additional models as content is created for them.

### Supported Operating Systems

The following operating system are supported:

- Microsoft Windows 10
- Microsoft Windows 8.1
- Microsoft Windows 8
- Microsoft Windows 7

## Package Parameters

- `/CleanStartmenu` Removes frequently used Lenovo System Update shortcuts from the Startmenu.

## Installation

installation without parameters.

```ps1
 choco install lenovo-system-update
```

installation with parameters.

```ps1
 choco install lenovo-system-update --params="'/CleanStartmenu'"
```

## Disclaimer

These Chocolatey Packages only contain installation routines. The software itself is downloaded from the official sources of the software developer. ITIGO AG has no affilation with the software developer.

## Author

- [David Gardiner](https://david.gardiner.net.au)
- [Simon Bärlocher](https://sbaerlocher.ch)
- [ITIGO AG](https://www.itigo.ch)

## License

This project is under the Apache-2.0 License. See the [LICENSE](LICENSE) file for the full license text.
