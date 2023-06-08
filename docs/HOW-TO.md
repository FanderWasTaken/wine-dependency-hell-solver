## How to use:

Make sure that you have `curl` and `7z` installed on your system before proceeding.

1. Download and extract the latest release.
2. Open your terminal in the extracted folder.
3. Make `.sh` executable by running `chmod +x ./installers/Download_installers.sh`.
4. Run `./installers/Download_installers.sh` in your terminal. This will download  all the required installation files.
5. Run `WDHS.bat` with Wine or Proton inside the game's prefix; the script will inform you when it's done.

Steps 1-4 are only for people running this for the first time. You can keep downloaded installers and `WDHS.bat` somewhere in your home directory to re-use later if needed.

## Additional tips for a better gaming experience

[Protontricks](https://github.com/Matoking/protontricks) can be used to execute `WDHS.bat` with a double click and applied to any Steam game you have installed.

If you are using [Lutris](https://lutris.net/), go into `Preferences`, `Global Options` for **Wine runner** and make sure to have `Disable Lutris Runtime` and `Prefer system libraries` enabled (switched on).

Also, I personally recommend you install `gamescope` package from your distribution and use it with games. [Gamescope](https://github.com/ValveSoftware/gamescope) can fix screen-tearing and lower overall input latency during gameplay. It can be enabled via [Lutris](https://lutris.net/)' `Preferences`, `System Options` menus. For Steam games, add `gamescope -f -e -h [your screen resolution, e.g. 1080] -r [optional framerate cap, e.g. 60] -- %command%` as a launch option.

Windows uses virtual memory in weird ways. The default Linux limit on virtual memory is likely to be too low, which may result in game crashes. You can increase virtual memory permanently. Update the `vm.max_map_count=2147483642` setting in `/etc/sysctl.conf`. To verify after rebooting, run `sysctl vm.max_map_count`.

If you wish to import your [Lutris](https://lutris.net/) games to Steam with the least amount of headaches, use [Steam ROM Manager](https://github.com/SteamGridDB/steam-rom-manager). Despite its name, SRM can import data from `.desktop` application shortcut. How does it differ from importing games directly from Lutris? It allows you to add custom artwork for games, sourced from [SteamGridDB](https://www.steamgriddb.com/). Create a new Parser and use `Non Steam Shortcuts` as a template. Add `*/${title}@(.desktop|.DESKTOP)` as `User's glob` parameter and lead `ROMs directory` to the path you have your games installed. Create a desktop shortcut for your game from Lutris and place `.desktop` shortcut into your game's directory. Save, go to `Preview` and press `Parse`.

[DXVK](https://github.com/doitsujin/dxvk) can cause stuttering while playing a game for the first time, which ruins the experience. In order to minimize the amount of stuttering, run `sudo nano /etc/profile.d/gpl.sh` add this line: `RADV_PERFTEST=gpl`. Press `CTRL+O` to save changes and `CTRL+X` to exit. Reboot to apply the changes.

## Troubleshooting
Before opening an issue, make sure to try different [Wine](https://www.winehq.org/) or [Proton](https://github.com/ValveSoftware/Proton) versions with your game. The recommended path is to go from the newest release down to the oldest. Personally, I found that Proton 7 had fewer compatibility issues than Proton 8.