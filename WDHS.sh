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
echo "Setup for WDHS is going to start now."
echo "-------------------------------------------------------------------"

instd=$HOME/WDHS

echo " ~ The install path is: $instd."
echo " ~ Downloading Installers. It may take a while..."

mkdir -p $instd
cd $instd

idirs=(
    '7z'
    'codecs'
    'directx'
    'fonts'
    'mono'
    'physx'
    'vcredist'
    'gecko'
)

for i in "${!idirs[@]}"; do
    mkdir -p installers/${idirs[$i]} &
done
wait

urls=(
    'https://7-zip.org/a/7z2409-x64.exe'
    'https://download.microsoft.com/download/8/4/A/84A35BF1-DAFE-4AE8-82AF-AD2AE20B6B14/directx_Jun2010_redist.exe'
    'http://us.download.nvidia.com/Windows/9.09.0428/PhysX_9.09.0428_SystemSoftware.exe'
    'https://github.com/abbodi1406/vcredist/releases/download/v0.85.0/VisualCppRedist_AIO_x86_x64.exe'
    'https://download.microsoft.com/download/vc60pro/Update/2/W9XNT4/EN-US/VC6RedistSetup_deu.exe'
    'https://web.archive.org/web/20210126114402/http://download.microsoft.com/download/1/9/f/19fe4660-5792-4683-99e0-8d48c22eed74/Vs6sp6.exe'
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
    'https://sourceforge.net/projects/corefonts/files/the%20fonts/final/wd97vwr32.exe'
    'https://sourceforge.net/projects/corefonts/files/the%20fonts/final/webdin32.exe'
    'https://dl.winehq.org/wine/wine-gecko/2.47/wine_gecko-2.47-x86_64.msi'
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
    'fonts/wd97vwr32.exe'
    'fonts/webdin32.exe'
    'gecko/wine-gecko.msi'
)

for i in "${!urls[@]}"; do
    wget -c ${urls[$i]} -O installers/${outs[$i]} --quiet &
done
wait

echo " ~ Extracting files..."

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

echo " ~ Getting the WDHS.bat..."

wget -c https://raw.githubusercontent.com/FanderWasTaken/wine-dependency-hell-solver/main/extras/WDHS.bat -O $instd/WDHS.bat --quiet
wait

echo "-------------------------------------------------------------------"
echo "Setup has been completed successfully!"
echo "Now you can run $instd/WDHS.bat."
