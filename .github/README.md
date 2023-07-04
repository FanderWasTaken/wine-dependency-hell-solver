# Wine Dependency Hell Solver

![logo](WDHS.png)

## Introduction

Ever had issues launching or running Windows games or applications under Wine? If the answer is "Yes", then try the scripts I made, it should solve most issues you may encounter. 

## Description

This is a script that functions similarly to how Valve's installscript.vdf does. The said .vdf file installs Windows dependencies upon first launch for games to work properly. However, not all Steam games come with all the required dependencies installed, as well as non-Steam and abandonware games don't always come with these either. So I decided to write a universal script to install **every single dependency** any game may require to work. This script should work with any Wine version and prefix manager, including Steam.

## Examples

Here are games that were fixed completely or partially after running this script:

- [Call of Juarez: Bound in Blood](https://github.com/ValveSoftware/Proton/issues/1831) - Various issues related to sound and video playback.
- [Darksiders](https://github.com/ValveSoftware/Proton/issues/264) - Game renders empty screen instead of the main menu, in-game UI and cut-scenes.
- [Mortal Kombat Komplete Edition](https://github.com/ValveSoftware/Proton/issues/1185) - The main issue is an empty screen you get when trying to choose a character.
- [Tell Me Why](https://github.com/ValveSoftware/Proton/issues/6829) - Crashes during certain cut-scenes.
- [The Darkness II](https://github.com/ValveSoftware/Proton/issues/563) - Voice over is missing.
- [Warhammer 40,000: Boltgun](https://github.com/ValveSoftware/Proton/issues/6795) - Has broken cut-scenes or missing audio during these cut-scenes.

## Packages

| Software | Fixes |
|---|---|
| [DirectX End-User Runtimes](https://www.microsoft.com/en-us/download/details.aspx?id=8109) | Video and audio playback, missing or broken UI and menus |
| [ASP.NET Core Runtime](https://dotnet.microsoft.com/en-us/download) | Crashing installers |
| [Media Foundation](https://github.com/z0z0z/mf-installcab) | Some cases of video playback |
| [NVIDIA PhysX](https://www.nvidia.com/en-us/drivers/physx/9_09_0428/physx_9-09-0428_whql/) | Games crashing when relying heavily on the technology |
| [Visual C++ Redistributable packages](https://www.microsoft.com/en-us/download/details.aspx?id=30679) | Various crashes and missing .dll issues |


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

### Crashes

If you're using an integrated GPU, set a fixed amount of memory allocated towards your GPU in your BIOS, don't leave it on Auto. And if you have both discreet and integrated GPUs then make sure that your BIOS' preferences are set to prioritize PCI-E GPU over the integrated one.

The default Linux limit on virtual memory is pretty low. Add the `vm.max_map_count=1048576` to the `/etc/sysctl.conf` to increase that limit.

Try running games with [proton-ge-custom](https://github.com/GloriousEggroll/proton-ge-custom) or [wine-ge-custom](https://github.com/GloriousEggroll/wine-ge-custom). [ProtonUp-Qt](https://davidotek.github.io/protonup-qt/) offers the easies way to install these.

### Audio

Sometimes it's possible to hear audio crackling or sound cutting out during gameplay. To remedy this add `PULSE_LATENCY_MSEC=60` to `/etc/profile.d/pulselatency.sh`. Also make sure that your system is not using PipeWire and WirePlumber, switch to PulseAudio instead as it seems to cause less issues.

### Game Feel

[Gamescope](https://github.com/ValveSoftware/gamescope) can reduce screen-tearing and lower overall input latency during gameplay. Add `gamescope -f -e -h [your screen vertical resolution, e.g. 1080] -r [optional framerate cap, e.g. 60] -- %command%` as a launch option in Steam. 

To reduce screen tearing on X11 further, make sure to follow [this guide](https://linuxreviews.org/HOWTO_fix_screen_tearing).

[DXVK](https://github.com/doitsujin/dxvk) can cause stuttering while playing a game for the first time, which ruins the experience. In order to minimize the amount of stuttering, add `RADV_PERFTEST=gpl` to `/etc/profile.d/gpl.sh` with a text editor, reboot to apply the changes. **Mesa 23.1 and newer has this variable set by default.** For games made with [Unreal Engine](https://www.unrealengine.com/en-US) plesae use [dxvk-gplasync](https://gitlab.com/Ph42oN/dxvk-gplasync/-/releases). Be sure to read [instructions provided by the developer](https://gitlab.com/Ph42oN/dxvk-gplasync#options) on how to use it.

### Lutris

When using Lutris, make sure to go into Wine runner settings and disable `DXVK-NVAPI DLSS emulation` as it can cause games to crash.

Gamescope can be enabled via Lutris' `Preferences`, `System Options` menus.

You can use [Steam ROM Manager](https://github.com/SteamGridDB/steam-rom-manager) if you wish to import your Lutris games to Steam with the least amount of headaches. Despite its name, SRM can import data from `.desktop` application shortcuts. It also allows you to add custom artwork for games, sourced from [SteamGridDB](https://www.steamgriddb.com/). Create a new Parser and use `Non Steam Shortcuts` as a template. Add `*/${title}@(.desktop|.DESKTOP)` as `User's glob` parameter and lead `ROMs directory` to the path where you have your games installed. Create a desktop shortcut for your game from Lutris and place `.desktop` shortcut into your game's directory. Save, go to `Preview`, press `Parse` and add your games with desired artwork.

## Credits
- [installscript.vdf | Valve](https://partner.steamgames.com/doc/sdk/installscripts)
- [Troubleshooting Guide | PCGamingWiki](https://www.pcgamingwiki.com/wiki/Troubleshooting_guide)
- Project was created with the help of [Visual Studio Code](https://code.visualstudio.com/)

---

Feel free to donate if you like my work or if I was of any help to you!