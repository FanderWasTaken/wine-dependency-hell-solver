#!/bin/bash

# Open current directory
cd "$(dirname "$0")"

# Downloading
echo Downloading Runtime Installers. This may take a while...

urls=(
    'https://download.microsoft.com/download/8/4/A/84A35BF1-DAFE-4AE8-82AF-AD2AE20B6B14/directx_Jun2010_redist.exe' 
    'https://download.visualstudio.microsoft.com/download/pr/7a8350d6-6a71-4fb4-a4e5-d9c2049b131b/cd6f32423fe9a43812c18ca493964e35/aspnetcore-runtime-6.0.16-win-x86.zip' 
    'https://download.visualstudio.microsoft.com/download/pr/579135b3-8d18-4267-9f05-819f31931eb8/a03bcc68c2247d44649cfdde685694b7/aspnetcore-runtime-6.0.16-win-x64.zip' 
    'https://download.visualstudio.microsoft.com/download/pr/e5cb9bbc-6c3d-4ca2-b57e-47de252e7861/209669f62b361008007f66fffa6af38e/aspnetcore-runtime-7.0.5-win-x86.zip'
    'https://download.visualstudio.microsoft.com/download/pr/82e7d963-e5b6-41fe-84d1-a8c3f1a75bd7/fe22d4a60c66449d3e97a246fc41d10b/aspnetcore-runtime-7.0.5-win-x64.zip'
    'http://download.windowsupdate.com/msdownload/update/software/svpk/2011/02/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe'
    'http://download.windowsupdate.com/msdownload/update/software/svpk/2011/02/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe'
    'https://us.download.nvidia.com/Windows/9.09.0428/PhysX_9.09.0428_SystemSoftware.exe'
    'https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe'
    'https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe'
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
    'vcredist/vcredist_x86.exe'
    'vcredist/vcredist_x64.exe'
    )

for i in "${!urls[@]}"; 
do 
curl ${urls[$i]} -o ${outs[$i]} --silent &
done
wait

# Extract downloaded 
echo Extracting files...

7z x -o./directx/ directx/directx_Jun2010_redist.exe

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

for i in "${!zips[@]}"; 
do 
unzip -q ${zips[$i]} -d ${dirs[$i]} &
done
wait

# Remove .zip files

echo Cleaning up...

torm=(
    'directx/directx_Jun2010_redist.exe' 
    'dotnet/aspnetcore-runtime-6.0.16-win-x86.zip' 
    'dotnet/aspnetcore-runtime-6.0.16-win-x64.zip' 
    'dotnet/aspnetcore-runtime-7.0.5-win-x86.zip'
    'dotnet/aspnetcore-runtime-7.0.5-win-x64.zip'
    )

for i in "${!torm[@]}"; 
do 
rm ${torm[$i]} &
done
wait

cat ui/WDHS.txt
echo  

read -p "Finished downloading. Now you can run WDHS.bat with Wine within the required prefix. Press Enter to close the terminal." </dev/tty
wait
rm ./WDHS.txt
rm ./Download_installers.sh
exit