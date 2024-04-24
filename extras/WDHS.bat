@echo off
CD %~dp0
:: Create message box
echo Set objArgs = WScript.Arguments > msg.vbs
echo messageText = objArgs(0) >> msg.vbs
echo MsgBox messageText >> msg.vbs
cscript msg.vbs "Packages are going to be installed now. Caution: there will be some windows showing up rapidly."
echo Installing dependencies. Please wait, there will be a pop-up window when everything is installed...
start /wait installers/directx/DXSETUP.exe /silent
start /wait installers/physx/PhysX.exe /quiet
start /wait installers/vcredist/vcredist2005_x86.exe /q
start /wait installers/vcredist/vcredist2005_x64.exe /q
start /wait installers/vcredist/vcredist2008_x86.exe /qb
start /wait installers/vcredist/vcredist2008_x64.exe /qb
start /wait installers/vcredist/vcredist2010_x86.exe /passive /norestart
start /wait installers/vcredist/vcredist2010_x64.exe /passive /norestart
start /wait installers/vcredist/vcredist2012_x86.exe /passive /norestart
start /wait installers/vcredist/vcredist2012_x64.exe /passive /norestart
start /wait installers/vcredist/vcredist2013_x86.exe /passive /norestart
start /wait installers/vcredist/vcredist2013_x64.exe /passive /norestart
start /wait installers/vcredist/vcredist2015_2017_2019_2022_x86.exe /passive /norestart
start /wait installers/vcredist/vcredist2015_2017_2019_2022_x64.exe /passive /norestart
start /wait installers/mono/wine-mono.msi
start /wait installers/codecs/klcp.bat
cscript msg.vbs "Installation was completed successfully!"
exit