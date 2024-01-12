# Wine Dependency Hell Solver

![logo](WDHS.png)

## Description

If you ever had issues launching or running software with Wine, then try this script. I made it as a replacement for Winetricks and Protontricks, it functions similarly to Valve's installscript.vdf. Because not every piece of software comes with all the required dependencies, this script installs **every single required dependency**. So you can spend more time on using the software you want and less time on tinkering.

## Packages

| Dependency                                                                                 | What it fixes                                                |
| ------------------------------------------------------------------------------------------ | ------------------------------------------------------------ |
| [DirectX End-User Runtimes](https://www.microsoft.com/en-us/download/details.aspx?id=8109) | Video and audio playback, missing or broken in-game elements |
| [K-Lite Codec Pack](https://codecguide.com/about_kl.htm)                                   | Broken video and audio playback in games                     |
| [Mono](https://wiki.winehq.org/Mono)                                                       | Crashing programs, installers and games                      |
| [NVIDIA PhysX](https://www.nvidia.com/en-us/drivers/physx/9_09_0428/physx_9-09-0428_whql/) | Crashes when relying heavily on the technology               |
| [Visual C++ Redistributable Packages](https://github.com/abbodi1406/vcredist)              | Various crashes and missing .dll issues                      |

**All installers are taken directly from the official sources**

## Instructions

Make sure to have the following packages installed before proceeding: `7z wget`

1. Run `bash <(curl -sSL https://raw.githubusercontent.com/FanderWasTaken/wine-dependency-hell-solver/main/WDHS.sh)` in your terminal.
2. Start `WDHS.bat` with [Protontricks](https://github.com/Matoking/protontricks) by double clicking it or via Wine, Heroic, Lutris or Bottles.

## Tips

<details><summary> General improvements</summary>

In case if you experience any issues with performance, be sure to check [this guide](https://linux-gaming.kwindu.eu/index.php?title=Improving_performance) out.

</details>

<details><summary> Shader cache and DXVK related stuttering</summary>

In order to minimize stuttering with Wine on Mesa below version 23.1, use [dxvk-async](https://github.com/Sporif/dxvk-async).

**Mesa 23.1 made GPL the default way of working with shaders. That means that there would be a severe reduction in stutters one could encounter while using DXVK for games. There is no need to use patched DXVK versions if you have newer Mesa.**

</details>

<details><summary> GStreamer and Wine</summary>

Be sure to follow guides on installing latest [GStreamer](https://gstreamer.freedesktop.org/documentation/installing/on-linux.html?gi-language=c) and [Wine](https://wiki.winehq.org/Download) for your distribution.

</details>

## Credits

- [installscript.vdf | Valve](https://partner.steamgames.com/doc/sdk/installscripts)
- [Troubleshooting Guide | PCGamingWiki](https://www.pcgamingwiki.com/wiki/Troubleshooting_guide)
- Project was created with the help of [Visual Studio Code](https://code.visualstudio.com/) ❤️

---

Feel free to donate if you like my work or if I was of any help to you!
