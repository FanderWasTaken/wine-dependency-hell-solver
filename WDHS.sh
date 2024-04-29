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
    'https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.EXE'
    'https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE'
    'https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe'
    'https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe'
    'https://download.microsoft.com/download/E/E/0/EE05C9EF-A661-4D9E-BCE2-6961ECDF087F/vcredist_x64.exe'
    'https://download.microsoft.com/download/E/E/0/EE05C9EF-A661-4D9E-BCE2-6961ECDF087F/vcredist_x86.exe'
    'https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe'
    'https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe'
    'https://aka.ms/highdpimfc2013x64enu'
    'https://aka.ms/highdpimfc2013x86enu'
    'https://aka.ms/vs/17/release/VC_redist.x64.exe'
    'https://aka.ms/vs/17/release/VC_redist.x86.exe'
    'https://dl.winehq.org/wine/wine-mono/8.1.0/wine-mono-8.1.0-x86.msi'
    'https://files2.codecguide.com/K-Lite_Codec_Pack_1800_Mega.exe'
)
outs=(
    'directx/directx.exe'
    'physx/PhysX.exe'
    'vcredist/vcp2005x64.exe'
    'vcredist/vcp2005x86.exe'
    'vcredist/vcp2008x64.exe'
    'vcredist/vcp2008x86.exe'
    'vcredist/vcp2010x64.exe'
    'vcredist/vcp2010x86.exe'
    'vcredist/vcp2012x64.exe'
    'vcredist/vcp2012x86.exe'
    'vcredist/vcp2013x64.exe'
    'vcredist/vcp2013x86.exe'
    'vcredist/vcp2015+x64.exe'
    'vcredist/vcp2015+x86.exe'
    'mono/wine-mono.msi'
    'codecs/K-Lite_Codec_Pack.exe'
)

for i in "${!urls[@]}"; do
    wget -c ${urls[$i]} -O installers/${outs[$i]} --quiet &
done
wait

echo " ~ Extracting files..."

7z x -oinstallers/directx/ installers/directx/directx.exe -y >installers/directx/null

echo " ~ Cleaning up..."

torm=(
    'directx/directx.exe'
    'directx/null'
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
