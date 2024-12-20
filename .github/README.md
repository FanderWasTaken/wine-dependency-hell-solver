# Wine Dependency Hell Solver 🍷

![logo](WDHS.png)

## Description

If you ever had issues with software in Wine, then try this script. I made it as an alternative for Wine/Proton-tricks, so you can spend more time using the software you want and less time tinkering. The main goal of this project is to provide users with dependencies similar to Valve's installscript.vdf.

*Please note that not every game or program can be fixed by this script, but it should help in most cases.*

## Contents

* [7zip](https://7-zip.org/)
* [DirectX End-User Runtimes](https://www.pcgamingwiki.com/wiki/Glossary:DirectX)
* [LAVFilters ](https://github.com/Nevcairiel/LAVFilters)
* [Microsoft Visual C++ Redistributable Packages](https://github.com/abbodi1406/vcredist)
* [NVIDIA PhysX](https://www.pcgamingwiki.com/wiki/Glossary:PhysX)
* [Wine Mono](https://gitlab.winehq.org/mono/wine-mono)
* [XNA Framework Redistributable](https://www.pcgamingwiki.com/wiki/Engine:XNA)

## Instructions

Make sure to have the following packages installed before proceeding: `7z wget`.

1. Run `this command` in your terminal.

   ```
   bash <(wget -qO- https://raw.githubusercontent.com/FanderWasTaken/wine-dependency-hell-solver/main/WDHS.sh)
   ```

2. Start `WDHS.bat` with Wine.

## Additional configuration

Here are some of the best practices to follow in order to minimize potential issues when running software with Wine:

* [Increase <code>swap</code> size](https://wiki.archlinux.org/title/Swap)
* [Increase the value of <code>vm.max\_map\_count</code>](https://wiki.archlinux.org/title/Gaming#Increase_vm.max_map_count)
* [Load shared objects immediately](https://wiki.archlinux.org/title/Gaming#Load_shared_objects_immediately_for_better_first_time_latency)
* [Update to newer version of Wine](https://github.com/DavidoTek/ProtonUp-Qt) ⭐️
  * I recommend builds from [Kron4ek](https://github.com/Kron4ek/Wine-Builds)
* [Update your graphics drivers](https://github.com/lutris/docs/blob/master/InstallingDrivers.md)
* Update your system ⭐️

## Credits

* [7-Zip | Igor Pavlov](https://7-zip.org/)
* [installscript.vdf | Valve](https://partner.steamgames.com/doc/sdk/installscripts) ⭐️
* [LAVFilters |  Nevcairiel](https://github.com/Nevcairiel/LAVFilters)
* [OpenAL | Creative Technology](https://www.openal.org/)
* [Troubleshooting Guide | PCGamingWiki](https://www.pcgamingwiki.com/wiki/Troubleshooting_guide) ⭐️
* [VisualCppRedist AIO | abbodi1406](https://github.com/abbodi1406/vcredist)
* [Wine Mono | Wine Developers](https://gitlab.winehq.org/mono/wine-mono)

***

**Project was created with the help of [VSCodium](https://vscodium.com/) ❤️**
