#!/bin/bash

clear

echo "Setup for WDHS is going to start now."
echo "-------------------------------------------------------------------"

instd=$HOME/WDHS

echo " ~ The install path is: $instd."
echo " ~ Downloading Installers... It may take a while."

mkdir -p $instd
cd $instd

idirs=(
    'directx'
    'dotnet'
    'mf'
    'physx'
    'vcredist'
)

for i in "${!idirs[@]}"; do
    mkdir -p installers/${idirs[$i]} &
done
wait

urls=(
    'https://download.microsoft.com/download/8/4/A/84A35BF1-DAFE-4AE8-82AF-AD2AE20B6B14/directx_Jun2010_redist.exe'
    'https://download.visualstudio.microsoft.com/download/pr/7a8350d6-6a71-4fb4-a4e5-d9c2049b131b/cd6f32423fe9a43812c18ca493964e35/aspnetcore-runtime-6.0.16-win-x86.zip'
    'https://download.visualstudio.microsoft.com/download/pr/579135b3-8d18-4267-9f05-819f31931eb8/a03bcc68c2247d44649cfdde685694b7/aspnetcore-runtime-6.0.16-win-x64.zip'
    'https://download.visualstudio.microsoft.com/download/pr/e5cb9bbc-6c3d-4ca2-b57e-47de252e7861/209669f62b361008007f66fffa6af38e/aspnetcore-runtime-7.0.5-win-x86.zip'
    'https://download.visualstudio.microsoft.com/download/pr/82e7d963-e5b6-41fe-84d1-a8c3f1a75bd7/fe22d4a60c66449d3e97a246fc41d10b/aspnetcore-runtime-7.0.5-win-x64.zip'
    'http://download.windowsupdate.com/msdownload/update/software/svpk/2011/02/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe'
    'http://download.windowsupdate.com/msdownload/update/software/svpk/2011/02/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe'
    'https://us.download.nvidia.com/Windows/9.09.0428/PhysX_9.09.0428_SystemSoftware.exe'
    'https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe'
    'https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe'
    'https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe'
    'https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe'
    'https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe'
    'https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe'
    'https://aka.ms/highdpimfc2013x86enu'
    'https://aka.ms/highdpimfc2013x64enu'
    'https://aka.ms/vs/17/release/vc_redist.x86.exe'
    'https://aka.ms/vs/17/release/vc_redist.x64.exe'
)
outs=(
    'directx/directx_Jun2010_redist.exe'
    'dotnet/aspnetcore-runtime-6.0.16-win-x86.zip'
    'dotnet/aspnetcore-runtime-6.0.16-win-x64.zip'
    'dotnet/aspnetcore-runtime-7.0.5-win-x86.zip'
    'dotnet/aspnetcore-runtime-7.0.5-win-x64.zip'
    'mf/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe'
    'mf/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe'
    'physx/PhysX_9.09.0428_SystemSoftware.exe'
    'vcredist/vcredist_x86_2008.exe'
    'vcredist/vcredist_x64_2008.exe'
    'vcredist/vcredist_x86_2010.exe'
    'vcredist/vcredist_x64_2010.exe'
    'vcredist/vcredist_x86_2012.exe'
    'vcredist/vcredist_x64_2012.exe'
    'vcredist/vcredist_x86_2013.exe'
    'vcredist/vcredist_x64_2013.exe'
    'vcredist/vcredist_x86_2022.exe'
    'vcredist/vcredist_x64_2022.exe'
)

for i in "${!urls[@]}"; do
    wget -c ${urls[$i]} -O installers/${outs[$i]} --quiet &
done
wait

echo " ~ Extracting files..."

7z x -oinstallers/directx/ installers/directx/directx_Jun2010_redist.exe -y >installers/directx/null

zips=(
    'dotnet/aspnetcore-runtime-6.0.16-win-x86.zip'
    'dotnet/aspnetcore-runtime-6.0.16-win-x64.zip'
    'dotnet/aspnetcore-runtime-7.0.5-win-x86.zip'
    'dotnet/aspnetcore-runtime-7.0.5-win-x64.zip'
)
dirs=(
    'dotnet/aspnetcore-runtime-6.0.16-win-x86'
    'dotnet/aspnetcore-runtime-6.0.16-win-x64'
    'dotnet/aspnetcore-runtime-7.0.5-win-x86'
    'dotnet/aspnetcore-runtime-7.0.5-win-x64'
)

for i in "${!zips[@]}"; do
    unzip -q installers/${zips[$i]} -d installers/${dirs[$i]} &
done
wait

echo " ~ Cleaning up..."

torm=(
    'directx/directx_Jun2010_redist.exe'
    'directx/null'
    'dotnet/aspnetcore-runtime-6.0.16-win-x86.zip'
    'dotnet/aspnetcore-runtime-6.0.16-win-x64.zip'
    'dotnet/aspnetcore-runtime-7.0.5-win-x86.zip'
    'dotnet/aspnetcore-runtime-7.0.5-win-x64.zip'
)

for i in "${!torm[@]}"; do
    rm installers/${torm[$i]} &
done
wait

echo " ~ Creating the WDHS.bat..."

echo '@echo off' >WDHS.bat
wait

lines=(
    'CD %~dp0'
    ':: Create message box'
    'echo Set objArgs = WScript.Arguments > msg.vbs'
    'echo messageText = objArgs(0) >> msg.vbs'
    'echo MsgBox messageText >> msg.vbs'
    'cscript msg.vbs "Packages are going to be installed now. There will be a pop-up window when everything is installed. Caution: There will be some windows showing up rapidly."'
    ':: 64 or 32 bit?'
    'set IS_X64=0 && if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set IS_X64=1) else (if "%PROCESSOR_ARCHITEW6432%"=="AMD64" (set IS_X64=1))'
    'if "%IS_X64%" == "1" goto X64'
    'echo Installing Runtimes (32-bit)...'
    'start /wait installers/directx/DXSETUP.exe /silent'
    'start /wait installers/dotnet/aspnetcore-runtime-6.0.16-win-x86/dotnet.exe /q '
    'start /wait installers/dotnet/aspnetcore-runtime-7.0.5-win-x86/dotnet.exe /q'
    'start /wait installers/mf/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe mediafoundation'
    'start /wait installers/mf/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe mf_'
    'start /wait installers/mf/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe mfreadwrite'
    'start /wait installers/mf/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe wmadmod'
    'start /wait installers/mf/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe wmvdecod'
    'start /wait installers/mf/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe wmadmod'
    'start /wait regsvr32 colorcnv.dll'
    'start /wait regsvr32 msmpeg2adec.dll'
    'start /wait regsvr32 msmpeg2vdec.dll'
    'start /wait installers/physx/PhysX_9.09.0428_SystemSoftware.exe /quiet'
    'start /wait installers/vcredist/vcredist_x86_2008.exe /qb'
    'start /wait installers/vcredist/vcredist_x86_2010.exe /passive /norestart'
    'start /wait installers/vcredist/vcredist_x86_2012.exe /passive /norestart'
    'start /wait installers/vcredist/vcredist_x86_2013.exe /passive /norestart'
    'start /wait installers/vcredist/vcredist_x86_2022.exe /passive /norestart'
    'goto END'
    ':X64'
    'echo Installing Runtimes (64-bit)...'
    'start /wait installers/directx/DXSETUP.exe /silent'
    'start /wait installers/dotnet/aspnetcore-runtime-6.0.16-win-x64/dotnet.exe /q'
    'start /wait installers/dotnet/aspnetcore-runtime-6.0.16-win-x86/dotnet.exe /q'
    'start /wait installers/dotnet/aspnetcore-runtime-7.0.5-win-x64/dotnet.exe /q'
    'start /wait installers/dotnet/aspnetcore-runtime-7.0.5-win-x86/dotnet.exe /q'
    'start /wait installers/mf/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe mediafoundation'
    'start /wait installers/mf/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe mf_'
    'start /wait installers/mf/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe mfreadwrite'
    'start /wait installers/mf/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe wmadmod'
    'start /wait installers/mf/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe wmvdecod'
    'start /wait installers/mf/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe wmadmod'
    'start /wait regsvr32 colorcnv.dll'
    'start /wait regsvr32 msmpeg2adec.dll'
    'start /wait regsvr32 msmpeg2vdec.dll'
    'start /wait installers/physx/PhysX_9.09.0428_SystemSoftware.exe /quiet'
    'start /wait installers/vcredist/vcredist_x86_2008.exe /qb'
    'start /wait installers/vcredist/vcredist_x64_2008.exe /qb'
    'start /wait installers/vcredist/vcredist_x86_2010.exe /passive /norestart'
    'start /wait installers/vcredist/vcredist_x64_2010.exe /passive /norestart'
    'start /wait installers/vcredist/vcredist_x86_2012.exe /passive /norestart'
    'start /wait installers/vcredist/vcredist_x64_2012.exe /passive /norestart'
    'start /wait installers/vcredist/vcredist_x86_2013.exe /passive /norestart'
    'start /wait installers/vcredist/vcredist_x64_2013.exe /passive /norestart'
    'start /wait installers/vcredist/vcredist_x86_2022.exe /passive /norestart'
    'start /wait installers/vcredist/vcredist_x64_2022.exe /passive /norestart'
    'goto END'
    ':END'
    'cscript msg.vbs "Installation was completed successfully!"'
    ':: Cleaning up'
    'del msg.vbs'
    'exit'
)

for i in "${!lines[@]}"; do
    echo ${lines[$i]} >>WDHS.bat &
    wait
done
wait

echo "-------------------------------------------------------------------"
echo "Setup has been completed successfully!"
echo "Now you can run $instd/WDHS.bat with Wine, Lutris, or Protontricks."
