Clear-Host

Write-Output "  "
Write-Output "  "
Write-Output "  "
Write-Output "  "
Write-Output "  "
Write-Output "  "
Write-Output "  "
Write-Output "Setup for WDHS is going to start now."
Write-Output "-------------------------------------------------------------------"

$instd = 'C:\WDHS'

Write-Output " ~ The install path is: $instd."
Write-Output " ~ Downloading Installers... It may take a while."

mkdir $instd -Force | Out-Null

$idirs = (
    'directx',
    'dotnet',
    'mf',
    'physx',
    'vcredist'
)

foreach ($idir in $idirs) {
    mkdir $instd\installers\$idir -Force | Out-Null
}

Invoke-WebRequest -Uri 'https://download.microsoft.com/download/8/4/A/84A35BF1-DAFE-4AE8-82AF-AD2AE20B6B14/directx_Jun2010_redist.exe' -OutFile "$instd\installers\directx\directx_Jun2010_redist.exe" | Out-Null
Invoke-WebRequest -Uri 'https://download.visualstudio.microsoft.com/download/pr/7a8350d6-6a71-4fb4-a4e5-d9c2049b131b/cd6f32423fe9a43812c18ca493964e35/aspnetcore-runtime-6.0.16-win-x86.zip' -OutFile "$instd\installers\dotnet\aspnetcore-runtime-6.0.16-win-x86.zip" | Out-Null
Invoke-WebRequest -Uri 'https://download.visualstudio.microsoft.com/download/pr/579135b3-8d18-4267-9f05-819f31931eb8/a03bcc68c2247d44649cfdde685694b7/aspnetcore-runtime-6.0.16-win-x64.zip' -OutFile "$instd\installers\dotnet\aspnetcore-runtime-6.0.16-win-x64.zip" | Out-Null
Invoke-WebRequest -Uri 'https://download.visualstudio.microsoft.com/download/pr/e5cb9bbc-6c3d-4ca2-b57e-47de252e7861/209669f62b361008007f66fffa6af38e/aspnetcore-runtime-7.0.5-win-x86.zip' -OutFile "$instd\installers\dotnet\aspnetcore-runtime-7.0.5-win-x86.zip" | Out-Null
Invoke-WebRequest -Uri 'https://download.visualstudio.microsoft.com/download/pr/82e7d963-e5b6-41fe-84d1-a8c3f1a75bd7/fe22d4a60c66449d3e97a246fc41d10b/aspnetcore-runtime-7.0.5-win-x64.zip' -OutFile "$instd\installers\dotnet\aspnetcore-runtime-7.0.5-win-x64.zip" | Out-Null
Invoke-WebRequest -Uri 'http://download.windowsupdate.com/msdownload/update/software/svpk/2011/02/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe' -OutFile "$instd\installers\mf\windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe" | Out-Null
Invoke-WebRequest -Uri 'http://download.windowsupdate.com/msdownload/update/software/svpk/2011/02/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe' -OutFile "$instd\installers\mf\windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe" | Out-Null
Invoke-WebRequest -Uri 'https://us.download.nvidia.com/Windows/9.09.0428/PhysX_9.09.0428_SystemSoftware.exe' -OutFile "$instd\installers\physx\PhysX_9.09.0428_SystemSoftware.exe" | Out-Null
Invoke-WebRequest -Uri 'https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe' -OutFile "$instd\installers\vcredist\vcredist_x86_2008.exe" | Out-Null
Invoke-WebRequest -Uri 'https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe' -OutFile "$instd\installers\vcredist\vcredist_x64_2008.exe" | Out-Null
Invoke-WebRequest -Uri 'https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe' -OutFile "$instd\installers\vcredist\vcredist_x86_2010.exe" | Out-Null
Invoke-WebRequest -Uri 'https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe' -OutFile "$instd\installers\vcredist\vcredist_x64_2010.exe" | Out-Null
Invoke-WebRequest -Uri 'https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe' -OutFile "$instd\installers\vcredist\vcredist_x86_2012.exe" | Out-Null
Invoke-WebRequest -Uri 'https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe' -OutFile "$instd\installers\vcredist\vcredist_x64_2012.exe" | Out-Null
Invoke-WebRequest -Uri 'https://aka.ms/highdpimfc2013x86enu' -OutFile "$instd\installers\vcredist\vcredist_x86_2013.exe" | Out-Null
Invoke-WebRequest -Uri 'https://aka.ms/highdpimfc2013x64enu' -OutFile "$instd\installers\vcredist\vcredist_x64_2013.exe" | Out-Null
Invoke-WebRequest -Uri 'https://aka.ms/vs/17/release/vc_redist.x86.exe' -OutFile "$instd\installers\vcredist\vcredist_x86_2022.exe" | Out-Null
Invoke-WebRequest -Uri 'https://aka.ms/vs/17/release/vc_redist.x64.exe' -OutFile "$instd\installers\vcredist\vcredist_x64_2022.exe" | Out-Null

Write-Output " ~ Extracting files..."

Start-Process -FilePath "$instd\installers\directx\directx_Jun2010_redist.exe" -ArgumentList "/Q /C /T:$instd\installers\directx\"

Expand-Archive "$instd\installers\dotnet\aspnetcore-runtime-6.0.16-win-x86.zip" "$instd\installers\dotnet\aspnetcore-runtime-6.0.16-win-x86" | Out-Null
Expand-Archive "$instd\installers\dotnet\aspnetcore-runtime-6.0.16-win-x64.zip" "$instd\installers\dotnet\aspnetcore-runtime-6.0.16-win-x64" | Out-Null
Expand-Archive "$instd\installers\dotnet\aspnetcore-runtime-7.0.5-win-x86.zip" "$instd\installers\dotnet\aspnetcore-runtime-7.0.5-win-x86" | Out-Null
Expand-Archive "$instd\installers\dotnet\aspnetcore-runtime-7.0.5-win-x64.zip" "$instd\installers\dotnet\aspnetcore-runtime-7.0.5-win-x64" | Out-Null

Write-Output " ~ Cleaning up..."

$torm = (
    'dotnet\aspnetcore-runtime-6.0.16-win-x86.zip',
    'dotnet\aspnetcore-runtime-6.0.16-win-x64.zip',
    'dotnet\aspnetcore-runtime-7.0.5-win-x86.zip',
    'dotnet\aspnetcore-runtime-7.0.5-win-x64.zip'
)

foreach ($rm in $torm) {
    Remove-Item $instd\installers\$rm | Out-Null
}

Write-Output " ~ Getting the WDHS.bat..."

Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/FanderWasTaken/wine-dependency-hell-solver/main/WDHS.bat' -OutFile "$instd\WDHS.bat" | Out-Null

Write-Output "-------------------------------------------------------------------"
Write-Output "Setup has been completed successfully!"
Write-Output "Now you can run $instd\WDHS.bat."
