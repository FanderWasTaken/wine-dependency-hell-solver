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
echo Installing Runtimes (32-bit)...
start /wait installers/directx/DXSETUP.exe /silent
start /wait installers/dotnet/aspnetcore-runtime-6.0.16-win-x86/dotnet.exe /q 
start /wait installers/dotnet/aspnetcore-runtime-7.0.5-win-x86/dotnet.exe /q
start /wait installers/mf/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe mediafoundation
start /wait installers/mf/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe mf_
start /wait installers/mf/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe mfreadwrite
start /wait installers/mf/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe wmadmod
start /wait installers/mf/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe wmvdecod
start /wait installers/mf/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe wmadmod
start /wait installers/physx/PhysX_9.09.0428_SystemSoftware.exe /quiet
start /wait installers/vcredist/vcredist_x86_2008.exe /qb
start /wait installers/vcredist/vcredist_x86_2010.exe /passive /norestart
start /wait installers/vcredist/vcredist_x86_2012.exe /passive /norestart
start /wait installers/vcredist/vcredist_x86_2013.exe /passive /norestart
start /wait installers/vcredist/vcredist_x86_2022.exe /passive /norestart
goto END
:X64
echo Installing Runtimes (64-bit)...
start /wait installers/directx/DXSETUP.exe /silent
start /wait installers/dotnet/aspnetcore-runtime-6.0.16-win-x64/dotnet.exe /q
start /wait installers/dotnet/aspnetcore-runtime-6.0.16-win-x86/dotnet.exe /q
start /wait installers/dotnet/aspnetcore-runtime-7.0.5-win-x64/dotnet.exe /q
start /wait installers/dotnet/aspnetcore-runtime-7.0.5-win-x86/dotnet.exe /q
start /wait installers/mf/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe mediafoundation
start /wait installers/mf/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe mf_
start /wait installers/mf/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe mfreadwrite
start /wait installers/mf/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe wmadmod
start /wait installers/mf/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe wmvdecod
start /wait installers/mf/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe wmadmod
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
goto END
:END
cscript msg.vbs "Installation was completed successfully!"
:: Cleaning up
del msg.vbs
exit