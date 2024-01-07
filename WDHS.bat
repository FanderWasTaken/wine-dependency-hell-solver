@echo off
CD %~dp0
:: Create message box
echo Set objArgs = WScript.Arguments > msg.vbs
echo messageText = objArgs(0) >> msg.vbs
echo MsgBox messageText >> msg.vbs
cscript msg.vbs "Packages are going to be installed now. There will be a pop-up window when everything is installed. Caution: There will be some windows showing up rapidly."
:: 64 or 32 bit?
set IS_X64=0 && if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set IS_X64=1) else (if "%PROCESSOR_ARCHITEW6432%"=="AMD64" (set IS_X64=1))
if "%IS_X64%" == "1" goto X64
echo Installing dependencies (32-bit)...
start /wait installers/directx/DXSETUP.exe /silent
start /wait installers/dotnet/aspnetcore-runtime-6.0.16-win-x86/dotnet.exe /q 
start /wait installers/dotnet/aspnetcore-runtime-7.0.5-win-x86/dotnet.exe /q
start /wait installers/physx/PhysX_9.09.0428_SystemSoftware.exe /quiet
start /wait installers/vcredist/vcredist_x86_2008.exe /qb
start /wait installers/vcredist/vcredist_x86_2010.exe /passive /norestart
start /wait installers/vcredist/vcredist_x86_2012.exe /passive /norestart
start /wait installers/vcredist/vcredist_x86_2013.exe /passive /norestart
start /wait installers/vcredist/vcredist_x86_2022.exe /passive /norestart
start /wait installers/codecs/klcp.bat
goto END
:X64
echo Installing dependencies (64-bit)...
start /wait installers/directx/DXSETUP.exe /silent
start /wait installers/dotnet/aspnetcore-runtime-6.0.16-win-x64/dotnet.exe /q
start /wait installers/dotnet/aspnetcore-runtime-6.0.16-win-x86/dotnet.exe /q
start /wait installers/dotnet/aspnetcore-runtime-7.0.5-win-x64/dotnet.exe /q
start /wait installers/dotnet/aspnetcore-runtime-7.0.5-win-x86/dotnet.exe /q
start /wait installers/physx/PhysX_9.09.0428_SystemSoftware.exe /quiet
start /wait installers/vcredist/vcredist_x86_2008.exe /qb
start /wait installers/vcredist/vcredist_x64_2008.exe /qb
start /wait installers/vcredist/vcredist_x86_2010.exe /passive /norestart
start /wait installers/vcredist/vcredist_x64_2010.exe /passive /norestart
start /wait installers/vcredist/vcredist_x86_2012.exe /passive /norestart
start /wait installers/vcredist/vcredist_x64_2012.exe /passive /norestart
start /wait installers/vcredist/vcredist_x86_2013.exe /passive /norestart
start /wait installers/vcredist/vcredist_x64_2013.exe /passive /norestart
start /wait installers/vcredist/vcredist_x86_2022.exe /passive /norestart
start /wait installers/vcredist/vcredist_x64_2022.exe /passive /norestart
start /wait installers/codecs/klcp.bat
goto END
:END
cscript msg.vbs "Installation was completed successfully!"
exit