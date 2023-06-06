## How to use:

Make sure that you have `curl` and `7z` installed on your system before proceeding.

1. Download and extract the latest release.
2. Open your terminal in the extracted folder.
3. Make `.sh` executable by running `chmod +x ./installers/Download_installers.sh`.
4. Run `./installers/Download_installers.sh` in your terminal. This will download  all the required installation files.
5. Run `WDHS.bat` with wine or proton inside the game's prefix; the script outputs install progress into the terminal, so it will inform you when it's done.

Steps 1-4 are only for people running this for the first time. You can keep downloaded installers and `WDHS.bat` somewhere in your home directory to re-use later if needed.

## Additional tips

If you are using Lutris, go into `Preferences`, `Global Options` for **Wine runner** and make sure to have `Disable Lutris Runtime` and `Prefer system libraries` enabled (switched on).

Also, I personally recommend you install `gamescope` package from your distribution and use it with games. Gamescope can fix screen-tearing and lower overall input latency during gameplay. It can be enabled via Lutris' `Preferences`, `System Options` menus. For Steam games, add `gamescope -f -e -h [your screen resolution, e.g. 1080] -r [optional framerate cap, e.g. 60] -- %command%` as a launch option.

## Troubleshooting
Before opening an issue, make sure to try different Wine or Proton versions with your game. The recommended path is to go from the newest release down to the oldest. Personally, I found that Proton 7 had fewer compatibility issues than Proton 8. The easiest way to install **custom** Wine builds is with [ProtonUp-Qt](https://davidotek.github.io/protonup-qt/).