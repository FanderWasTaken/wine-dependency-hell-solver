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
    'directx'
    'mono'
    'physx'
    'vcredist'
    'codecs'
)

for i in "${!idirs[@]}"; do
    mkdir -p installers/${idirs[$i]} &
done
wait

urls=(
    'https://download.microsoft.com/download/8/4/A/84A35BF1-DAFE-4AE8-82AF-AD2AE20B6B14/directx_Jun2010_redist.exe'
    'https://us.download.nvidia.com/Windows/9.09.0428/PhysX_9.09.0428_SystemSoftware.exe'
    'https://de1-dl.techpowerup.com/files/3luEBQK5UiuQo_j3NhD5pw/1714018172/Visual-C-Runtimes-All-in-One-Feb-2024.zip'
    'https://dl.winehq.org/wine/wine-mono/8.1.0/wine-mono-8.1.0-x86.msi'
    'https://files2.codecguide.com/K-Lite_Codec_Pack_1800_Mega.exe'
)
outs=(
    'directx/directx.exe'
    'physx/PhysX.exe'
    'vcredist/Visual-C-Runtimes-All-in-One-Feb-2024.zip'
    'mono/wine-mono.msi'
    'codecs/K-Lite_Codec_Pack.exe'
)

for i in "${!urls[@]}"; do
    wget -c ${urls[$i]} -O installers/${outs[$i]} --quiet &
done
wait

echo " ~ Extracting files..."

7z x -oinstallers/directx/ installers/directx/directx.exe -y >installers/directx/null
7z x -oinstallers/vcredist/ vcredist/Visual-C-Runtimes-All-in-One-Feb-2024.zip -y >installers/vcredist/null

echo " ~ Cleaning up..."

torm=(
    'directx/directx.exe'
    'directx/null'
    'vcredist/Visual-C-Runtimes-All-in-One-Feb-2024.zip'
    'installers/vcredist/null'
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
