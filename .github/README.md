# Wine Dependency Hell Solver 🍷

![logo](WDHS.png)

> **⚠️ DISCLAMER ⚠️**
>
> This script won't be able to fix games or programs with bad code in them. Most of the work for software compatibility with Wine is done by people who work on that project. This script did solve some issues with games I was running; that's why I decided to publish it online. If some game isn't fixed by this script or any steps outlined below, there's a chance that you're trying to run a poorly made game or program. For edge-cases, I'd advise using emulators and VMs instead, as those provide a much better experience, based on my testing.

## Description

If you ever had issues with software in Wine, then try this script. I made it as an alternative for Wine/Proton-tricks, so you can spend more time using the software you want and less time tinkering. The main goal of this project is to provide users with dependencies similar to Valve's installscript.vdf.

## Contents

| Dependency                                                                                                                           | Provides/Fixes                                                |
| ------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------ |
| [7zip](https://7-zip.org/)|Crashing/non-functioning installers|
| [DirectX End-User Runtimes](https://www.pcgamingwiki.com/wiki/Glossary:DirectX)                                           | Video and audio playback, missing or broken in-game elements |
| [LAVFilters ](https://github.com/Nevcairiel/LAVFilters)                                                                                     | DirectShow filters for correct video playback                                        |
| [Microsoft Visual C++ Redistributable Packages](https://github.com/abbodi1406/vcredist)               | Various crashes and missing .dll issues                      |
| [NVIDIA PhysX](https://www.pcgamingwiki.com/wiki/Glossary:PhysX)                                           | Crashes when relying heavily on the technology               |
| [Wine Mono](https://gitlab.winehq.org/mono/wine-mono) & [Microsoft .NET Desktop Runtime](https://www.pcgamingwiki.com/wiki/Windows#.NET_Framework) | Crashing programs, installers and games                      |

## Instructions

Make sure to have the following packages installed before proceeding: `7z wget`.

1. Run `this command` in your terminal.

   ```
   bash <(wget -qO- https://raw.githubusercontent.com/FanderWasTaken/wine-dependency-hell-solver/main/WDHS.sh)
   ```

2. Start `WDHS.bat` with Wine.

## Additional configuration

Here are some of the best practices to follow in order to minimize potential issues when running software with Wine:

* Update your system.
* [Update to newer version of Wine.](https://github.com/DavidoTek/ProtonUp-Qt) I recommend 'proton' builds from [Kron4ek](https://github.com/Kron4ek/Wine-Builds).
* [Update your graphics drivers.](https://github.com/lutris/docs/blob/master/InstallingDrivers.md)
* Disable Lutris Runtime in global settings.
* Run games in X11 session instead of Wayland.
* Do not use `gamescope` as a nested session.
* [Increase <code>swap</code> size.](https://wiki.archlinux.org/title/Swap)
* [Increase the value of <code>vm.max\_map\_count</code>.](https://wiki.archlinux.org/title/Gaming#Increase_vm.max_map_count)

## Credits

* [7-Zip | Igor Pavlov](https://7-zip.org/)
* [installscript.vdf | Valve](https://partner.steamgames.com/doc/sdk/installscripts) ⭐️
* [LAVFilters |  Nevcairiel](https://github.com/Nevcairiel/LAVFilters)
* [Troubleshooting Guide | PCGamingWiki](https://www.pcgamingwiki.com/wiki/Troubleshooting_guide) ⭐️
* [VisualCppRedist AIO | abbodi1406](https://github.com/abbodi1406/vcredist)
* [Wine Mono | Wine Developers](https://gitlab.winehq.org/mono/wine-mono)

***

**Project was created with the help of [VSCodium](https://vscodium.com/) ❤️**
