# Wine Dependency Hell Solver 🍷

![logo](WDHS.png)

## Description

If you ever had issues launching or running software with Wine, then try this script. I made it as a replacement for Wine/Proton-tricks. It functions similarly to Valve's installscript.vdf. Because not every piece of software comes with all the required dependencies, this script installs **every single required dependency**. So you can spend more time using the software you want and less time tinkering.

The main goal of this project is to provide users with dependencies that Wine can't ship. WMP and Windows system files aren't included here. If something still doesn't work after using this script and no Wine version fixes your issues, there's a chance that you're trying to run a half-baked piece of software.

## Why not use Wine/Proton-tricks?

Patching prefixes for each program can get really annoying if you have multiple things you need to configure and become a giant time-waster if some patch doesn't work well with a different one.

## Contents

| Dependency                                                                                                                           | Provides/Fixes                                                |
| ------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------ |
| [7zip](https://7-zip.org/)|Crashing/non-functioning installers|
| [DirectX End-User Runtimes](https://www.pcgamingwiki.com/wiki/Glossary:DirectX)                                           | Video and audio playback, missing or broken in-game elements |
| [LAVFilters ](https://github.com/Nevcairiel/LAVFilters)                                                                                     | DirectShow filters for correct video playback                                        |
| [Wine Mono](https://gitlab.winehq.org/mono/wine-mono) & [Microsoft .NET Desktop Runtime](https://www.pcgamingwiki.com/wiki/Windows#.NET_Framework) | Crashing programs, installers and games                      |
| [NVIDIA PhysX](https://www.pcgamingwiki.com/wiki/Glossary:PhysX)                                           | Crashes when relying heavily on the technology               |
| [Microsoft Visual C++ Redistributable Packages](https://github.com/abbodi1406/vcredist)               | Various crashes and missing .dll issues                      |

## Instructions

Make sure to have the following packages installed before proceeding: `7z wget`.

1. Run `this command` in your terminal.

   ```
   bash <(wget -qO- https://raw.githubusercontent.com/FanderWasTaken/wine-dependency-hell-solver/main/WDHS.sh)
   ```

2. Start `WDHS.bat` with Wine.

## Additional configuration

Even after installing all of these dependencies I still ran into some issues:

* Missing dlls (`unarc.dll` and `ISDone.dll`).
* Crashing games and installers.

Here are the solutions I've found, that may or may not work:

* Increase <code>swap</code> size.
* Increase the value of <code>vm.max\_map\_count</code>.
* Update to newer version of Wine. I recommend 'proton' builds from [here](https://github.com/Kron4ek/Wine-Builds).
* Update your graphics drivers.

## Credits

* [installscript.vdf | Valve](https://partner.steamgames.com/doc/sdk/installscripts)
* [Troubleshooting Guide | PCGamingWiki](https://www.pcgamingwiki.com/wiki/Troubleshooting_guide)

***

**Project was created with the help of [VSCodium](https://vscodium.com/) ❤️**
