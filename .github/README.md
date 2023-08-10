# Wine Dependency Hell Solver

![logo](WDHS.png)

## Introduction

If you ever had issues launching or running Windows games or applications under Wine, then try the script I made, it should solve most issues you may encounter.

## Description

This is a script that functions similarly to how Valve's installscript.vdf does. It installs Windows dependencies for games to work properly. However, not every game comes with all the required dependencies. So I decided to write a universal script to install **every single dependency** any game may require to work.

## Examples

Here are games that were fixed partially or completely after running this script:

- [Call of Juarez: Bound in Blood](https://github.com/ValveSoftware/Proton/issues/1831) - Issues with sound and video playback.
- [Darksiders](https://github.com/ValveSoftware/Proton/issues/264) - Missing main menu, in-game UI and cut-scenes.
- [Mortal Kombat Komplete Edition](https://github.com/ValveSoftware/Proton/issues/1185) - Broken character select screen.
- [Tell Me Why](https://github.com/ValveSoftware/Proton/issues/6829) - Cut-scenes crashes.
- [The Darkness II](https://github.com/ValveSoftware/Proton/issues/563) - Missing voice over.
- [Warhammer 40,000: Boltgun](https://github.com/ValveSoftware/Proton/issues/6795) - Broken cut-scenes.

## Packages

| Software                                                                                              | Fixes                                                    |
| ----------------------------------------------------------------------------------------------------- | -------------------------------------------------------- |
| [DirectX End-User Runtimes](https://www.microsoft.com/en-us/download/details.aspx?id=8109)            | Video and audio playback, missing or broken UI and menus |
| [ASP.NET Core Runtime](https://dotnet.microsoft.com/en-us/download)                                   | Crashing installers                                      |
| [Media Foundation](https://github.com/z0z0z/mf-installcab)                                            | Some cases of video playback                             |
| [NVIDIA PhysX](https://www.nvidia.com/en-us/drivers/physx/9_09_0428/physx_9-09-0428_whql/)            | Games crashing when relying heavily on the technology    |
| [Visual C++ Redistributable packages](https://www.microsoft.com/en-us/download/details.aspx?id=30679) | Various crashes and missing .dll issues                  |

**Disclaimer**: Though my script installs Media Foundation you may still exhibit unwanted behavior.

**All installers are taken directly from official sources.**

## Instructions

Make sure to have the following packages installed before proceeding: `7z curl`

1. Run `bash <(curl -sSL https://raw.githubusercontent.com/FanderWasTaken/wine-dependency-hell-solver/main/WDHS.sh)` in your terminal.
2. Start `WDHS.bat` with [Protontricks](https://github.com/Matoking/protontricks) by double clicking it or via Lutris.

<details>
    <summary> Lutris instructions</summary>
      
![lutris step one](lutris_1.png)

![lutris step two](lutris_2.png)

</details>

## Additional fixes and improvements

<details><summary> General advice</summary>

Ultimately, through my own experience, I've found that running a semi-rolling release distro would result in best game to work ratio. That means that your system will be stable, in a sense that it won't crash often and behave unpredictably, but also you will rip the benefits of newer Mesa updates and general Linux Kernel performance and stability improvements. So I wouldn't recommend using something like Ubuntu or Debian Stable for general-purpose computing. My recommendations would include: Fedora, Debian Testing, Debian Sid, Arch Linux.
</details>

<details><summary> Display settings</summary>

Wayland helps to alleviate most issues related to screen-tearing, frame pacing and input latency. If you're experiencing screen-tearing or bad frame pacing, e.g. lag, on X11, please follow [this guide](https://linuxreviews.org/HOWTO_fix_screen_tearing).
</details>

<details><summary> Debian, Ubuntu and their derivatives</summary>

On Debian and Ubuntu base distros you need to install drivers.

- For AMD use this command: `sudo dpkg --add-architecture i386 && sudo apt update && sudo apt upgrade && sudo apt install libgl1-mesa-dri:i386 mesa-vulkan-drivers mesa-vulkan-drivers:i386`

- For NVIDIA your distro should offer you a way to download a driver upon first boot or have them pre-installed. Run this command to add packages that may not have been installed automatically: `sudo dpkg --add-architecture i386 && sudo apt update && sudo apt install -y libvulkan1 libvulkan1:i386`

**I highly discourage you from using PPAs for Mesa or NVIDIA Drivers** as they can potentially brick your system. And if you do update in that way, please use `ppa-purge` in order to remove these packages if any issues do arise.

</details>

<details><summary> Shader cache and DXVK related stuttering</summary>

In order to minimize stuttering with Bottles or Lutris on Mesa under version 23.1, use [dxvk-async](https://github.com/Sporif/dxvk-async). For Lutris you can install it into `~/.local/share/lutris/runtime/dxvk`. Add `DXVK_ASYNC=1` environment variable to your games to enable asynchronous DXVK shader compilation.

**Mesa 23.1 made GPL the default way of working with shaders. That means that there would be a severe reduction in stutters one could encounter while using DXVK for Windows games. There is no need to use patched DXVK versions if you have newer Mesa.**

</details>

<details><summary> Lutris tips</summary>

Make sure to disable `DXVK-NVAPI DLSS` for the Wine runner in Lutris as it can cause games to crash on AMD GPUs.

If you're running Arch, Fedora or any other distro that's updated frequently, disable Lutris' Runtime in Global Settings as it will cause issues due to being way out of date in comparison to the rest of your system.
</details>

## Credits

- [installscript.vdf | Valve](https://partner.steamgames.com/doc/sdk/installscripts)
- [Troubleshooting Guide | PCGamingWiki](https://www.pcgamingwiki.com/wiki/Troubleshooting_guide)
- Project was created with the help of [Visual Studio Code](https://code.visualstudio.com/)

---

Feel free to donate if you like my work or if I was of any help to you!
