# Wine Dependency Hell Solver

![logo](WDHS.png)

## Introduction

Ever had issues launching or running Windows games or applications under Wine? If the answer is "Yes", then try these scripts I made; they should solve most issues you may encounter. And in case my script did make your experience worse, then feel free to create an issue here on GitHub so I can help you out.

Although I made these scripts primarily for games, this can help application compatibility as well. Adobe apps use some DirectX for rendering, and some programs are written using .NET. So feel free to try it out in that use case as well.

Feel free to donate if you like my work or if I was of any help to you!

## Description

This is a collection of scripts that function similarly to how Valve's installscript.vdf does. The said .vdf file installs Windows dependencies upon first launch for games to work properly. However, not all Steam games come with all the required dependencies installed, as well as non-Steam and abandonware games don't always come with these either. So I decided to write a universal script to install **every single dependency** any game may require to work. These scripts should work with any Wine version and prefix manager, including Steam.

## Examples

Here are games that were fixed completely or partially after running this script:

- [Call of Juarez: Bound in Blood](https://github.com/ValveSoftware/Proton/issues/1831) - Various issues related to sound and video playback.
- [Darksiders](https://github.com/ValveSoftware/Proton/issues/264) - Game renders empty screen instead of the main menu, in-game UI and cut-scenes.
- [Mortal Kombat Komplete Edition](https://github.com/ValveSoftware/Proton/issues/1185) - The main issue is an empty screen you get when trying to choose a character.
- [Tell Me Why](https://github.com/ValveSoftware/Proton/issues/6829) - Crashes during certain cut-scenes.
- [The Darkness II](https://github.com/ValveSoftware/Proton/issues/563) - Voice over is missing.
- [Warhammer 40,000: Boltgun](https://github.com/ValveSoftware/Proton/issues/6795) - Has broken cut-scenes or missing audio during these cut-scenes.

## Packages

| Software | What it fixes |
|---|---|
| [DirectX End-User Runtimes](https://www.microsoft.com/en-us/download/details.aspx?id=8109) | Video and audio playback, missing or broken UI and menus |
| [ASP.NET Core Runtime](https://dotnet.microsoft.com/en-us/download) | Crashing installers |
| [Media Foundation](https://github.com/z0z0z/mf-installcab) | Some cases of video playback |
| [NVIDIA PhysX](https://www.nvidia.com/en-us/drivers/physx/9_09_0428/physx_9-09-0428_whql/) | Games crashing when relying heavily on the technology |
| [Visual C++ Redistributable packages](https://www.microsoft.com/en-us/download/details.aspx?id=30679) | Various crashes and missing .dll issues |


**Disclaimer**: Though my script installs Media Foundation dependencies you may still exhibit unwanted behavior.

**All installers are taken directly from official sources.**

## Instruction

Make sure that you have `curl` and `7z` installed on your system before proceeding.

1. Create a folder where you will download, unpack, and store all of the installers, and open your terminal in that folder.
2. Run `curl -s https://raw.githubusercontent.com/FanderWasTaken/wine-dependency-hell-solver/main/WDHS.sh -o WDHS.sh && chmod +x ./WDHS.sh && ./WDHS.sh`.
5. Start `WDHS.bat` with Wine or Proton inside the game's prefix.

## Troubleshooting

Before opening an issue, make sure to try different [Wine](https://www.winehq.org/) or [Proton](https://github.com/ValveSoftware/Proton) versions. The recommended path is to go from the newest release down to the oldest.

## Additional tips

[Protontricks](https://github.com/Matoking/protontricks) can be used to execute `WDHS.bat` with a double click and applied to any Steam game you have installed.

If you are using [Lutris](https://lutris.net/), go into `Preferences`, `Global Options` for **Wine runner** and make sure to have `Disable Lutris Runtime` and `Prefer system libraries` enabled (switched on).

Also, I personally recommend you install `gamescope` package from your distribution and use it with games. [Gamescope](https://github.com/ValveSoftware/gamescope) can fix screen-tearing and lower overall input latency during gameplay. It can be enabled via [Lutris](https://lutris.net/)' `Preferences`, `System Options` menus. For Steam games, add `gamescope -f -e -h [your screen resolution, e.g. 1080] -r [optional framerate cap, e.g. 60] -- %command%` as a launch option.

Windows uses virtual memory in weird ways. The default Linux limit on virtual memory is likely to be too low, which may result in game crashes. You can increase virtual memory permanently. Update the `vm.max_map_count=262144` setting in `/etc/sysctl.conf`. To verify after rebooting, run `sysctl vm.max_map_count`.

If you're using an integrated GPU, e.g. Vega of Intel, go into your BIOS and set a fixed amount of memory allocated towards your GPU, don't leave that setting on Auto as it will cause more "Out of Memory" errors. And if you have both discreet and integrated GPUs then make sure that your BIOS' preferences are set to prioritize PCI-E GPU over the integrated one.

If you wish to import your [Lutris](https://lutris.net/) games to Steam with the least amount of headaches, use [Steam ROM Manager](https://github.com/SteamGridDB/steam-rom-manager). Despite its name, SRM can import data from `.desktop` application shortcut. How does it differ from importing games directly from Lutris? It allows you to add custom artwork for games, sourced from [SteamGridDB](https://www.steamgriddb.com/). Create a new Parser and use `Non Steam Shortcuts` as a template. Add `*/${title}@(.desktop|.DESKTOP)` as `User's glob` parameter and lead `ROMs directory` to the path you have your games installed. Create a desktop shortcut for your game from Lutris and place `.desktop` shortcut into your game's directory. Save, go to `Preview` and press `Parse`.

[DXVK](https://github.com/doitsujin/dxvk) can cause stuttering while playing a game for the first time, which ruins the experience. In order to minimize the amount of stuttering, run `sudo nano /etc/profile.d/gpl.sh` add this line: `RADV_PERFTEST=gpl`. Press `CTRL+O` to save changes and `CTRL+X` to exit. Reboot to apply the changes.

## Issues unresolved

There seems to be an ongoing trend for games made with [Unreal Engine](https://www.unrealengine.com/en-US) to stutter incessantly, regardless of whether a shader compilation screen is present or not. In my testing, the stuttering issues occur with Unreal Engine 3 and upwards. [dxvk-gplasync](https://gitlab.com/Ph42oN/dxvk-gplasync) can be used as a hacky workaround, although it's not recommended as it has a low success rate at fixing the stuttering issue. Games that are known to exhibit this kind of behavior are: A Hat in Time, Remember Me, SIFU, Dead Space (2023), Callisto Protocol, Star Wars Jedi: Survivor, and probably more. The only real solution to this problem currently seems to be to not play games made with the Unreal Engine.


## Credits
- [installscript.vdf | Valve](https://partner.steamgames.com/doc/sdk/installscripts)
- [Troubleshooting Guide | PCGamingWiki](https://www.pcgamingwiki.com/wiki/Troubleshooting_guide)
- Project was created with the help of [VSCodium](https://vscodium.com/)