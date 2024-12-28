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
start /wait installers/codecs/lav.exe /SP- /VERYSILENT /NORESTART /NOICONS
start /wait installers/codecs/oalinst.exe /silent
start /wait installers/fonts/andale32.exe /Q
start /wait installers/fonts/arial32.exe /Q
start /wait installers/fonts/arialb32.exe /Q
start /wait installers/fonts/comic32.exe /Q
start /wait installers/fonts/courie32.exe /Q
start /wait installers/fonts/georgi32.exe /Q
start /wait installers/fonts/impact32.exe /Q
start /wait installers/fonts/times32.exe /Q
start /wait installers/fonts/trebuc32.exe /Q
start /wait installers/fonts/verdan32.exe /Q
start /wait installers/fonts/wd97vwr32.exe /Q
start /wait installers/fonts/webdin32.exe /Q
start /wait installers/gecko/wine-gecko.msi
cscript msg.vbs "Installation has completed successfully."
exit