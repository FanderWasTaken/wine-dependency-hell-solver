# Wine Dependency Hell Solver

![logo](WDHS.png)

> ⚠️ **Warning for Linux users** ⚠️
>
> These fixes only work on latest [Proton-GE](https://github.com/GloriousEggroll/proton-ge-custom) and [Wine-GE](https://github.com/gloriouseggroll/wine-ge-custom) version 7, version 8 breaks video playback as of January 2024

## Introduction

If you ever had issues launching or running software with Wine or on Windows, then try this script I made, it should resolve most issues you encountered

## Description

This is a script that functions similarly to how Valve's installscript.vdf does. It installs dependencies for games to work properly. However, not every game comes with all the required dependencies. So I decided to write a universal script to install **every single dependency** any game may require to work

## Examples

> Here are the games that I was able to fix

### Various issues

- [Call of Juarez: Bound in Blood](https://github.com/ValveSoftware/Proton/issues/1831) - Issues with sound and video playback
- [Darksiders](https://github.com/ValveSoftware/Proton/issues/264) - Missing main menu, in-game UI and cut-scenes
- [Mortal Kombat Komplete Edition](https://github.com/ValveSoftware/Proton/issues/1185) - Broken character select screen
- [The Darkness II](https://github.com/ValveSoftware/Proton/issues/563) - Missing voice over

### Cut-scenes playback

- [Persona 4 Golden](https://github.com/ValveSoftware/Proton/issues/3982)
- [Tell Me Why](https://github.com/ValveSoftware/Proton/issues/6829)
- [Ultra Street Fighter IV](https://github.com/ValveSoftware/Proton/issues/345)
- [Warhammer 40,000: Boltgun](https://github.com/ValveSoftware/Proton/issues/6795)

## Packages

| Dependency                                                                                                                                                              | What it fixes                                            |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------- |
| [DirectX End-User Runtimes](https://www.microsoft.com/en-us/download/details.aspx?id=8109)                                                                              | Video and audio playback, missing or broken UI and menus |
| [ASP.NET Core Runtime](https://dotnet.microsoft.com/en-us/download)                                                                                                     | Crashing installers and games                            |
| [Media Foundation](https://github.com/z0z0z/mf-installcab), [K-Lite Codec Pack](https://codecguide.com/about_kl.htm) & [WMP](https://archive.org/details/wmp9_20210117) | Broken video and audio playback                          |
| [NVIDIA PhysX](https://www.nvidia.com/en-us/drivers/physx/9_09_0428/physx_9-09-0428_whql/)                                                                              | Games crashing when relying heavily on the technology    |
| [Visual C++ Redistributable packages](https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170)                                           | Various crashes and missing .dll issues                  |

> **Linux Disclaimer**: Use builds by [Thomas Crider, e.g. GloriousEggroll](https://github.com/GloriousEggroll) in case of any issues

**Most of the installers are taken directly from the official sources, review install scripts for download links. They're safe as far as I'm aware**

## Instructions

### Linux 🐧

Make sure to have the following packages installed before proceeding: `7z wget`

1. Run `bash <(curl -sSL https://raw.githubusercontent.com/FanderWasTaken/wine-dependency-hell-solver/main/WDHS.sh)` in your terminal.
2. Start `WDHS.bat` with [Protontricks](https://github.com/Matoking/protontricks) by double clicking it or via Wine, Heroic, Lutris or Bottles.

### Windows 🪟

1. Run `irm https://raw.githubusercontent.com/FanderWasTaken/wine-dependency-hell-solver/main/WDHS.ps1 | iex` in your terminal.
2. Start `WDHS.bat` as Administrator.

## General tips

### Linux 🐧

<details><summary> General improvements</summary>

In case if you experience any issues with performance, be sure to check [this guide](https://linux-gaming.kwindu.eu/index.php?title=Improving_performance) out.

</details>

<details><summary> Shader cache and DXVK related stuttering</summary>

In order to minimize stuttering with Wine on Mesa below version 23.1, use [dxvk-async](https://github.com/Sporif/dxvk-async).

**Mesa 23.1 made GPL the default way of working with shaders. That means that there would be a severe reduction in stutters one could encounter while using DXVK for games. There is no need to use patched DXVK versions if you have newer Mesa.**

</details>

<details><summary> Fix cutscenes that use WMP</summary>

Install and configure `gamescope` with these arguments `--rt -r <desired_framerate> --immediate-flips` in Lutris. It will allow videos to play without game minimizing (it seems like on Windows these games run WMP in borderless mode above the game's window and play a video that way).

In order to apply this fix to all games run from Steam, start it with this command: `gamescope --rt -r <desired_framerate> --immediate-flips -f -e -h <desired_vertical_resolution> -- steam -bigpicture`.

**If you have an external fps limiter (like GOverlay) be sure to remove `-r <desired_framerate>` from the commands above. Lutris games that are imported to Steam still must have `gamescope` configured in Lutris itself, otherwise things will break.**

</details>

### Windows 🪟

<details><summary>System setup, updates and drivers</summary>

Make sure to run `dism /online /cleanup-image /checkhealth` in a Terminal or PowerShell as Administrator. This will fix any issues you have with your Windows install.

Don't change things that you don't fully understand the use of or don't know how to recover from these changes.

Install latest drivers from [AMD](https://www.amd.com/en/support), [NVIDIA](https://www.nvidia.com/download/index.aspx) or [Intel](https://www.intel.com/content/www/us/en/search.html#sort=relevancy&f:@tabfilter=[Downloads]&f:@stm_10385_en=[Graphics]) for your hardware, non-beta releases are recommended.

</details>

## Credits

- [installscript.vdf | Valve](https://partner.steamgames.com/doc/sdk/installscripts)
- [Troubleshooting Guide | PCGamingWiki](https://www.pcgamingwiki.com/wiki/Troubleshooting_guide)
- [PowerShell Documentation | Microsoft](https://learn.microsoft.com/en-us/powershell/?view=powershell-7.3)
- [Gamescope guide | Linux Gaming Wiki](https://linux-gaming.kwindu.eu/index.php?title=Gamescope)
- Project was created with the help of [Visual Studio Code](https://code.visualstudio.com/) ❤️

---

Feel free to donate if you like my work or if I was of any help to you!
