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
start /wait installers/vcredist/VisualCppRedist_AIO.exe /ai5
start /wait installers/vcredist/VisualCppRedist_AIO.exe /ai8
start /wait installers/vcredist/VisualCppRedist_AIO.exe /aiX
start /wait installers/vcredist/VisualCppRedist_AIO.exe /ai2
start /wait installers/vcredist/VisualCppRedist_AIO.exe /ai3
start /wait installers/vcredist/VisualCppRedist_AIO.exe /ai9
start /wait installers/vcredist/VisualCppRedist_AIO.exe /aiE
start /wait installers/vcredist/VisualCppRedist_AIO.exe /aiB
start /wait installers/vcredist/VisualCppRedist_AIO.exe /aiC
start /wait installers/vcredist/VisualCppRedist_AIO.exe /aiV
start /wait installers/mono/wine-mono.msi
start /wait installers/codecs/klcp.bat
cscript msg.vbs "Installation was completed successfully!"
exit