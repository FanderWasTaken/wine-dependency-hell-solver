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
start /wait installers/vcredist/vcp2005x64.exe /q
start /wait installers/vcredist/vcp2005x86.exe /q
start /wait installers/vcredist/vcp2008x64.exe /qb
start /wait installers/vcredist/vcp2008x86.exe /qb
start /wait installers/vcredist/vcp2010x64.exe /passive /norestart
start /wait installers/vcredist/vcp2010x86.exe /passive /norestart
start /wait installers/vcredist/vcp2012x64.exe /passive /norestart
start /wait installers/vcredist/vcp2012x86.exe /passive /norestart
start /wait installers/vcredist/vcp2013x64.exe /passive /norestart
start /wait installers/vcredist/vcp2013x86.exe /passive /norestart
start /wait installers/vcredist/vcp2015+x64.exe /passive /norestart
start /wait installers/vcredist/vcp2015+x86.exe /passive /norestart
start /wait installers/mono/wine-mono.msi
start /wait installers/net/net86.exe /q
start /wait installers/net/net64.exe /q
cscript msg.vbs "Installation was completed successfully!"
exit