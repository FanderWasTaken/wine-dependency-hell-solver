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
    'net'
    'codecs'
)

for i in "${!idirs[@]}"; do
    mkdir -p installers/${idirs[$i]} &
done
wait

urls=(
    'https://download.microsoft.com/download/8/4/A/84A35BF1-DAFE-4AE8-82AF-AD2AE20B6B14/directx_Jun2010_redist.exe'
    'https://us.download.nvidia.com/Windows/9.19.0218/PhysX-9.19.0218-SystemSoftware.exe'
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
    'https://download.microsoft.com/download/vc60pro/Update/2/W9XNT4/EN-US/VC6RedistSetup_deu.exe'
    'https://web.archive.org/web/20160222035203/http://download.microsoft.com/download/1/9/f/19fe4660-5792-4683-99e0-8d48c22eed74/Vs6sp6.exe'
    'https://dl.winehq.org/wine/wine-mono/9.4.0/wine-mono-9.4.0-x86.msi'
    'https://download.visualstudio.microsoft.com/download/pr/1fbf5c5f-9770-402d-8971-83da662d8cf9/4e37b3c24bcb6004875b9f8b08024303/windowsdesktop-runtime-8.0.4-win-x86.exe'
    'https://download.visualstudio.microsoft.com/download/pr/c1d08a81-6e65-4065-b606-ed1127a954d3/14fe55b8a73ebba2b05432b162ab3aa8/windowsdesktop-runtime-8.0.4-win-x64.exe'
    'https://github.com/Nevcairiel/LAVFilters/releases/download/0.79.2/LAVFilters-0.79.2-Installer.exe'
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
