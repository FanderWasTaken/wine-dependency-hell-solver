#!/bin/bash

clear

echo "Setup for WDHS is going to start now."
echo "-------------------------------------------------------------------"

instd=$HOME/WDHS

echo " ~ The install path is: $instd."
echo " ~ Downloading Installers. It may take a while..."

mkdir -p $instd
cd $instd

idirs=(
    '7z'
    'directx'
    'mono'
    'physx'
    'vcredist'
    'net'
    'codecs'
)

for i in "${!idirs[@]}"; do
    mkdir -p installers/${idirs[$i]} &
done
wait

urls=(
    'https://7-zip.org/a/7z2409-x64.exe'
    'https://web.archive.org/web/20241210090520/https://download.microsoft.com/download/8/4/A/84A35BF1-DAFE-4AE8-82AF-AD2AE20B6B14/directx_Jun2010_redist.exe'
    'https://web.archive.org/web/20241122130514/http://us.download.nvidia.com/Windows/9.09.0428/PhysX_9.09.0428_SystemSoftware.exe'
    'https://github.com/abbodi1406/vcredist/releases/download/v0.85.0/VisualCppRedist_AIO_x86_x64.exe'
    'https://web.archive.org/web/20241001233748/https://download.microsoft.com/download/vc60pro/Update/2/W9XNT4/EN-US/VC6RedistSetup_deu.exe'
    'https://web.archive.org/web/20210126114402/http://download.microsoft.com/download/1/9/f/19fe4660-5792-4683-99e0-8d48c22eed74/Vs6sp6.exe'
    'https://dl.winehq.org/wine/wine-mono/9.4.0/wine-mono-9.4.0-x86.msi'
    'https://web.archive.org/web/20240511060222/https://download.visualstudio.microsoft.com/download/pr/1fbf5c5f-9770-402d-8971-83da662d8cf9/4e37b3c24bcb6004875b9f8b08024303/windowsdesktop-runtime-8.0.4-win-x86.exe'
    'https://web.archive.org/web/20241121062517/https://download.visualstudio.microsoft.com/download/pr/c1d08a81-6e65-4065-b606-ed1127a954d3/14fe55b8a73ebba2b05432b162ab3aa8/windowsdesktop-runtime-8.0.4-win-x64.exe'
    'https://github.com/Nevcairiel/LAVFilters/releases/download/0.79.2/LAVFilters-0.79.2-Installer.exe'
)
outs=(
    '7z/7z.exe'
    'directx/directx.exe'
    'physx/PhysX.exe'
    'vcredist/visual.exe'
    'vcredist/vcrun6.exe'
    'vcredist/vcrun6sp6.exe'
    'mono/wine-mono.msi'
    'net/net86.exe'
    'net/net64.exe'
    'codecs/lav.exe'
)

for i in "${!urls[@]}"; do
    wget -c ${urls[$i]} -O installers/${outs[$i]} --quiet &
done
wait

echo " ~ Extracting files..."

7z x -oinstallers/directx/ installers/directx/directx.exe -y >installers/null
7z x -oinstallers/vcredist/vcrun6/ installers/vcredist/vcrun6.exe -y >installers/null
7z x -oinstallers/vcredist/vcrun6sp6/ installers/vcredist/vcrun6sp6.exe -y >installers/null

echo " ~ Cleaning up..."

torm=(
    'null'
    'directx/directx.exe'
    'vcredist/vcrun6.exe'
    'vcredist/vcrun6sp6.exe'
)

for i in "${!torm[@]}"; do
    rm installers/${torm[$i]} &
done
wait

echo " ~ Getting the WDHS.bat..."

wget -c https://raw.githubusercontent.com/FanderWasTaken/wine-dependency-hell-solver/main/extras/WDHS.bat -O $instd/WDHS.bat --quiet
wait

echo "-------------------------------------------------------------------"
echo "Setup has been completed successfully!"
echo "Now you can run $instd/WDHS.bat."
