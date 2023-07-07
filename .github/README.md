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

Make sure to have the following packages installed before proceeding: `7z curl zenity`

1. Run `bash <(curl -sSL https://raw.githubusercontent.com/FanderWasTaken/wine-dependency-hell-solver/main/WDHS.sh)` in your terminal.
2. Start `WDHS.bat` with [Protontricks](https://github.com/Matoking/protontricks) by double clicking it or via Lutris.

<details>
    <summary>Lutris instructions</summary>
      
![lutris step one](lutris_1.png)

![lutris step two](lutris_2.png)

</details>

## Additional fixes and improvements

You can run the following commands to improve your experience, reboot to apply these changes:

- Fixes 'out of memory' crashes<br>
`sudo echo 'vm.max_map_count=1048576' >>/etc/sysctl.conf`<br>
- Fixes audio crackling<br>
`sudo echo 'PULSE_LATENCY_MSEC=60' >>/etc/profile.d/pulselatency.sh`<br>
- Fixes game stuttering<br>
`sudo echo 'RADV_PERFTEST=gpl' >>/etc/profile.d/gpl.sh`<br>

If you're using an integrated GPU, set a fixed amount of memory allocated towards it in your BIOS. And if you have both discreet and integrated GPUs then make sure that your BIOS' preferences are set to prioritize PCI-E GPU over the integrated one.

To remove screen tearing on X11, make sure to follow [this guide](https://linuxreviews.org/HOWTO_fix_screen_tearing).

For games made with [Unreal Engine](https://www.unrealengine.com/en-US) please follow guides on PCGamingWiki for [UE3](https://www.pcgamingwiki.com/wiki/Engine:Unreal_Engine_4) and [UE4](https://www.pcgamingwiki.com/wiki/Engine:Unreal_Engine_4) to fix the stuttering issue.

## Lutris integration into Steam

Make sure to go into settings and disable `DXVK-NVAPI DLSS emulation` for the Wine runner as it can cause games to crash or provide suboptimal results.

You can use [Steam ROM Manager](https://github.com/SteamGridDB/steam-rom-manager) if you wish to import your Lutris games to Steam with the least amount of headaches. Despite its name, SRM can import data from `.desktop` application shortcuts. It also allows you to add custom artwork for games, sourced from [SteamGridDB](https://www.steamgriddb.com/).

<details>
    <summary>Lutris parser guide</summary>
      
Create a new Parser and use `Non Steam Shortcuts` as a template. Add `*/${title}@(.desktop|.DESKTOP)` as `User's glob` parameter and lead `ROMs directory` to the path where you have your games installed. Create a desktop shortcut for your game from Lutris and place `.desktop` shortcut into your game's directory. Save, go to `Preview`, press `Parse` and add your games with desired artwork.

</details>

## Credits

- [installscript.vdf | Valve](https://partner.steamgames.com/doc/sdk/installscripts)
- [Troubleshooting Guide | PCGamingWiki](https://www.pcgamingwiki.com/wiki/Troubleshooting_guide)
- Project was created with the help of [Visual Studio Code](https://code.visualstudio.com/)

---

Feel free to donate if you like my work or if I was of any help to you!
