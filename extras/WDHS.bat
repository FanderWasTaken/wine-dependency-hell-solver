@echo off
CD %~dp0
:: Create message box
echo Set objArgs = WScript.Arguments > msg.vbs
echo messageText = objArgs(0) >> msg.vbs
echo MsgBox messageText >> msg.vbs
cscript msg.vbs "Packages are going to be installed now. Caution: there will be some windows showing up rapidly."
echo Installing dependencies. Please wait, there will be a pop-up window when everything is installed...
start /wait installers/7z/7z.exe /S
start /wait installers/directx/DXSETUP.exe /silent
start /wait installers/physx/PhysX.exe /quiet
start /wait installers/vcredist/visual.exe /ai58X239TEBV /gm2
start /wait installers/vcredist/vcrun6/vcredist.exe /T:C:/windows/system32 /C /Q:A
start /wait installers/vcredist/vcrun6sp6/vcredist.exe /T:C:/windows/system32 /C /Q:A
start /wait installers/mono/wine-mono.msi
start /wait installers/net/net86.exe /q
start /wait installers/net/net64.exe /q
start /wait installers/codecs/lav.exe /SP- /VERYSILENT /NORESTART /NOICONS
cscript msg.vbs "Installation has completed successfully."
exit