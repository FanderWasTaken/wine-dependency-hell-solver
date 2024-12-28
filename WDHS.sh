#!/bin/bash

clear

echo "
                       ██╗    ██╗██████╗ ██╗  ██╗███████╗
                       ██║    ██║██╔══██╗██║  ██║██╔════╝
                       ██║ █╗ ██║██║  ██║███████║███████╗
                       ██║███╗██║██║  ██║██╔══██║╚════██║
                       ╚███╔███╔╝██████╔╝██║  ██║███████║
                        ╚══╝╚══╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝
"
echo "                      Setup for WDHS is going to start now"
echo "--------------------------------------------------------------------------------"

instd=$HOME/WDHS

echo " ~ The install path is: $instd"
echo " ~ Creating directories"

mkdir -p $instd
cd $instd

idirs=(
    '7z'
    'codecs'
    'directx'
    'dotnet'
    'fonts'
    'gecko'
    'mono'
    'physx'
    'vcredist'
)

for i in "${!idirs[@]}"; do
    mkdir -p installers/${idirs[$i]} &
done
wait

echo " ~ Downloading installers ⤵
"

urls=(
    'https://7-zip.org/a/7z2409-x64.exe'
    'https://download.microsoft.com/download/8/4/A/84A35BF1-DAFE-4AE8-82AF-AD2AE20B6B14/directx_Jun2010_redist.exe'
    'http://us.download.nvidia.com/Windows/9.09.0428/PhysX_9.09.0428_SystemSoftware.exe'
    'https://github.com/abbodi1406/vcredist/releases/download/v0.85.0/VisualCppRedist_AIO_x86_x64.exe'
    'https://download.microsoft.com/download/vc60pro/Update/2/W9XNT4/EN-US/VC6RedistSetup_deu.exe'
    'https://www.ddsystem.com.br/update/setup/vb6+sp6/VS6SP6.EXE'
    'https://dl.winehq.org/wine/wine-mono/9.4.0/wine-mono-9.4.0-x86.msi'
    'https://github.com/Nevcairiel/LAVFilters/releases/download/0.79.2/LAVFilters-0.79.2-Installer.exe'
    'https://www.openal.org/downloads/oalinst.zip'
    'https://sourceforge.net/projects/corefonts/files/the%20fonts/final/andale32.exe'
    'https://sourceforge.net/projects/corefonts/files/the%20fonts/final/arial32.exe'
    'https://sourceforge.net/projects/corefonts/files/the%20fonts/final/arialb32.exe'
    'https://sourceforge.net/projects/corefonts/files/the%20fonts/final/comic32.exe'
    'https://sourceforge.net/projects/corefonts/files/the%20fonts/final/courie32.exe'
    'https://sourceforge.net/projects/corefonts/files/the%20fonts/final/georgi32.exe'
    'https://sourceforge.net/projects/corefonts/files/the%20fonts/final/impact32.exe'
    'https://sourceforge.net/projects/corefonts/files/the%20fonts/final/times32.exe'
    'https://sourceforge.net/projects/corefonts/files/the%20fonts/final/trebuc32.exe'
    'https://sourceforge.net/projects/corefonts/files/the%20fonts/final/verdan32.exe'
    'https://sourceforge.net/projects/corefonts/files/the%20fonts/final/webdin32.exe'
    'https://dl.winehq.org/wine/wine-gecko/2.47/wine_gecko-2.47-x86_64.msi'
    'https://download.visualstudio.microsoft.com/download/pr/1fbf5c5f-9770-402d-8971-83da662d8cf9/4e37b3c24bcb6004875b9f8b08024303/windowsdesktop-runtime-8.0.4-win-x86.exe'
    'https://download.visualstudio.microsoft.com/download/pr/c1d08a81-6e65-4065-b606-ed1127a954d3/14fe55b8a73ebba2b05432b162ab3aa8/windowsdesktop-runtime-8.0.4-win-x64.exe'
)
outs=(
    '7z/7z.exe'
    'directx/directx.exe'
    'physx/PhysX.exe'
    'vcredist/visual.exe'
    'vcredist/vcrun6.exe'
    'vcredist/vcrun6sp6.exe'
    'mono/wine-mono.msi'
    'codecs/lav.exe'
    'codecs/oal.zip'
    'fonts/andale32.exe'
    'fonts/arial32.exe'
    'fonts/arialb32.exe'
    'fonts/comic32.exe'
    'fonts/courie32.exe'
    'fonts/georgi32.exe'
    'fonts/impact32.exe'
    'fonts/times32.exe'
    'fonts/trebuc32.exe'
    'fonts/verdan32.exe'
    'fonts/webdin32.exe'
    'gecko/wine-gecko.msi'
    'dotnet/dotnet86.exe'
    'dotnet/dotnet64.exe'
)

for i in "${!urls[@]}"; do
    wget -c ${urls[$i]} -O installers/${outs[$i]} -q --show-progress --progress=bar:force 2>&1 &
    wait
done
wait

echo "
 ~ Extracting files..."

7z x -oinstallers/directx/ installers/directx/directx.exe -y >installers/null
7z x -oinstallers/vcredist/vcrun6/ installers/vcredist/vcrun6.exe -y >installers/null
7z x -oinstallers/vcredist/vcrun6sp6/ installers/vcredist/vcrun6sp6.exe -y >installers/null
7z x -oinstallers/codecs/ installers/codecs/oal.zip -y >installers/null

echo " ~ Cleaning up..."

torm=(
    'null'
    'directx/directx.exe'
    'vcredist/vcrun6.exe'
    'vcredist/vcrun6sp6.exe'
    'codecs/oal.zip'
)

for i in "${!torm[@]}"; do
    rm installers/${torm[$i]} &
done
wait

echo " ~ Getting the WDHS.bat ⤵
"

wget -c https://raw.githubusercontent.com/FanderWasTaken/wine-dependency-hell-solver/main/extras/WDHS.bat -O $instd/WDHS.bat -q --show-progress --progress=bar:force 2>&1
wait

echo "
--------------------------------------------------------------------------------"
echo "                      Setup has been completed successfully!

★ Now you can run $instd/WDHS.bat"
