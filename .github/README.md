# Wine Dependency Hell Solver

![logo](WDHS.png)

## Introduction

If you ever had issues launching or running software with Wine, then try this script I made, it should solve most issues you may encounter.

## Description

This is a script that functions similarly to how Valve's installscript.vdf does. It installs dependencies for games to work properly. However, not every game comes with all the required dependencies. So I decided to write a universal script to install **every single dependency** any game may require to work.

## Examples

Here are games that were fixed partially or completely after running this script:

- [Call of Juarez: Bound in Blood](https://github.com/ValveSoftware/Proton/issues/1831) - Issues with sound and video playback.
- [Darksiders](https://github.com/ValveSoftware/Proton/issues/264) - Missing main menu, in-game UI and cut-scenes.
- [Mortal Kombat Komplete Edition](https://github.com/ValveSoftware/Proton/issues/1185) - Broken character select screen.
- [Tell Me Why](https://github.com/ValveSoftware/Proton/issues/6829) - Cut-scenes crashes.
- [The Darkness II](https://github.com/ValveSoftware/Proton/issues/563) - Missing voice over.
- [Warhammer 40,000: Boltgun](https://github.com/ValveSoftware/Proton/issues/6795) - Broken cut-scenes.

*P.S. Certain game installers no longer fail due to missing .dll files*

## Packages

| Dependency                                                                                              | What it fixes                                                    |
| ----------------------------------------------------------------------------------------------------- | -------------------------------------------------------- |
| [DirectX End-User Runtimes](https://www.microsoft.com/en-us/download/details.aspx?id=8109)            | Video and audio playback, missing or broken UI and menus |
| [ASP.NET Core Runtime](https://dotnet.microsoft.com/en-us/download)                                   | Crashing installers and games                                      |
| [Media Foundation](https://github.com/z0z0z/mf-installcab)                                            | Some cases of video playback                             |
| [NVIDIA PhysX](https://www.nvidia.com/en-us/drivers/physx/9_09_0428/physx_9-09-0428_whql/)            | Games crashing when relying heavily on the technology    |
| [Visual C++ Redistributable packages](https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170) | Various crashes and missing .dll issues                  |

**Disclaimer**: Though my script installs Media Foundation you may still exhibit unwanted behavior. Use builds by [Thomas Crider, e.g. GloriousEggroll](https://github.com/GloriousEggroll) in case of any issues.

**All installers are taken directly from the official sources.**

## Instructions

Make sure to have the following packages installed before proceeding: `7z wget`

1. Run `bash <(curl -sSL https://raw.githubusercontent.com/FanderWasTaken/wine-dependency-hell-solver/main/WDHS.sh)` in your terminal.
2. Start `WDHS.bat` with [Protontricks](https://github.com/Matoking/protontricks) by double clicking it or via Wine, Heroic, Lutris or Bottles.

## General tips

<details><summary> Display settings</summary>

Wayland/Gamescope help to alleviate most issues related to screen-tearing, frame pacing and input latency. If you're experiencing screen-tearing or bad frame pacing, e.g. lag, on X11, please follow [this guide](https://linuxreviews.org/HOWTO_fix_screen_tearing).
</details>

<details><summary> Shader cache and DXVK related stuttering</summary>

In order to minimize stuttering with Wine on Mesa below version 23.1, use [dxvk-async](https://github.com/Sporif/dxvk-async).

**Mesa 23.1 made GPL the default way of working with shaders. That means that there would be a severe reduction in stutters one could encounter while using DXVK for games. There is no need to use patched DXVK versions if you have newer Mesa.**

</details>

## Credits

- [installscript.vdf | Valve](https://partner.steamgames.com/doc/sdk/installscripts)
- [Troubleshooting Guide | PCGamingWiki](https://www.pcgamingwiki.com/wiki/Troubleshooting_guide)
- Project was created with the help of [Visual Studio Code](https://code.visualstudio.com/)

---

Feel free to donate if you like my work or if I was of any help to you!
