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

Here are the solutions I've found:

<details>
<summary>Increase swap-file size to 2x the size of your RAM.</summary>
    
1. Disable the swap file with `swapoff`.

        sudo swapoff /swapfile

2.  Resize the file using `fallocate`, in this instance to a `4GB` swap file.

        sudo fallocate -l 4G /swapfile

3.  Mark the file as a _swapfile_ using `mkswap`.

        sudo mkswap /swapfile

4.  Enable the swap file with `swapon`.

        sudo swapon /swapfile

5.  Verify changes with `swapon`.

        swapon --show

    </details>

<details>
<summary>Increase the value of <code>vm.max_map_count</code>.</summary>

1.  Open `/etc/sysctl.conf` with `nano`.

        sudo nano /etc/sysctl.conf

2.  Add `vm.max_map_count=1048576` to the end of the file and save using `CTRL+X`.

3.  Verify changes with `sysctl`, the result should be `1048576`.

        sysctl vm.max_map_count

</details>

## Credits

- [installscript.vdf | Valve](https://partner.steamgames.com/doc/sdk/installscripts)
- [Troubleshooting Guide | PCGamingWiki](https://www.pcgamingwiki.com/wiki/Troubleshooting_guide)
- [Reddit comment | acejavelin69](https://www.reddit.com/r/linuxmint/comments/uhjyir/comment/i76gsi9/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button)
- [Virtual memory | Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html)
- Project was created with the help of [Visual Studio Code](https://code.visualstudio.com/) ❤️

---

Feel free to donate if you like my work or if I was of any help to you!
