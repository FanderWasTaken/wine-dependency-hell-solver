# Wine Dependency Hell Solver

![logo](WDHS.png)

## Description

If you ever had issues launching or running software with Wine, then try this script. I made it as a replacement for Wine/Proton-tricks, it functions similarly to Valve's installscript.vdf. Because not every piece of software comes with all the required dependencies, this script installs **every single required dependency**. So you can spend more time on using the software you want and less time on tinkering.

The main goal of this project is to provide users with dependencies that Wine can't ship. For that reason WMP and Windows System Files aren't included here. If something still doesn't work after using this script and no Wine version fixes your issues, there's a good chance that you're trying to run a half-baked piece of software.

> [!TIP]
> If you're having issues with your game or program of any kind try different Wine/Proton versions.

## Why not use Wine/Proton-tricks?

Patching prefixes for each program can get really annoying if you have multiple things you need to configure and become a giant time-waster if some patch doesn't work well with a different one.

## Contents

| Dependency                                                                                                                           | What it fixes                                                |
| ------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------ |
| [DirectX End-User Runtimes](https://www.microsoft.com/en-us/download/details.aspx?id=8109)                                           | Video and audio playback, missing or broken in-game elements |
| [Wine Mono](https://wiki.winehq.org/Mono) & [Microsoft .NET Desktop Runtime](https://dotnet.microsoft.com/en-us/download/dotnet/8.0) | Crashing programs, installers and games                      |
| [NVIDIA PhysX](https://www.nvidia.com/en-us/drivers/physx/9_09_0428/physx_9-09-0428_whql/)                                           | Crashes when relying heavily on the technology               |
| [Microsoft Visual C++ Redistributable Packages](https://gist.github.com/ChuckMichael/7366c38f27e524add3c54f710678c98b)               | Various crashes and missing .dll issues                      |
| [Xvid MPEG-4 Video Codec](https://www.xvid.com/)                                                                                     | Video playback issues                                        |

## Instructions

Make sure to have the following packages installed before proceeding: `7z wget`.

1.  Run `this command` in your terminal.

        bash <(wget -qO- https://raw.githubusercontent.com/FanderWasTaken/wine-dependency-hell-solver/main/WDHS.sh)

2.  Start `WDHS.bat` with Wine.

## Additional configuration

Even after installing all of these dependencies I still ran into some issues:

- Missing dlls (`unarc.dll` and `ISDone.dll`).
- Crashing games and installers.

Here are the solutions I've found, that may or may not work:

- Increase <code>swap</code> size.
- Increase the value of <code>vm.max_map_count</code>.

## Credits

- [installscript.vdf | Valve](https://partner.steamgames.com/doc/sdk/installscripts)
- [Troubleshooting Guide | PCGamingWiki](https://www.pcgamingwiki.com/wiki/Troubleshooting_guide)
- Project was created with the help of [VSCodium](https://vscodium.com/) ❤️

---

Feel free to donate if you like my work or if I was of any help to you!
