@echo off

:: Open installer's directory
CD %~dp0

cscript ui/MessageBox.vbs "Packages are going to be installed now. There will be a pop-up window when it's done installing. Caution: There will be some windows showing up rapidly."

echo Installing packages:

:: 64 or 32 bit?
set IS_X64=0 && if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set IS_X64=1) else (if "%PROCESSOR_ARCHITEW6432%"=="AMD64" (set IS_X64=1))
if "%IS_X64%" == "1" goto X64

::32-bit install

echo DirectX End-User Runtimes...
start /wait installers/directx/DXSETUP.exe /silent

echo ASP.NET Core Runtime...
start /wait installers/dotnet/aspnetcore-runtime-6.0.16-win-x86/dotnet.exe /q 
start /wait installers/dotnet/aspnetcore-runtime-7.0.5-win-x86/dotnet.exe /q

echo Media Foundation...
start /wait installers/mf/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe mediafoundation
start /wait installers/mf/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe mf_
start /wait installers/mf/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe mfreadwrite
start /wait installers/mf/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe wmadmod
start /wait installers/mf/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe wmvdecod
start /wait installers/mf/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe wmadmod
start /wait regedit.exe installers/mf/mf.reg
start /wait regedit.exe installers/mf/wmf.reg
start /wait regsvr32 colorcnv.dll
start /wait regsvr32 msmpeg2adec.dll
start /wait regsvr32 msmpeg2vdec.dll

echo NVIDIA PhysX...
start /wait installers/physx/PhysX_9.09.0428_SystemSoftware.exe /quiet

echo Visual C++ Redistributable packages...
start /wait installers/vcredist/vcredist_x86.exe /passive /norestart

goto END

:: 64-bit install
:X64

echo DirectX End-User Runtimes...
start /wait installers/directx/DXSETUP.exe /silent

echo ASP.NET Core Runtime...
start /wait installers/dotnet/aspnetcore-runtime-6.0.16-win-x64/dotnet.exe /q
start /wait installers/dotnet/aspnetcore-runtime-6.0.16-win-x86/dotnet.exe /q
start /wait installers/dotnet/aspnetcore-runtime-7.0.5-win-x64/dotnet.exe /q
start /wait installers/dotnet/aspnetcore-runtime-7.0.5-win-x86/dotnet.exe /q

echo Media Foundation...
start /wait installers/mf/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe mediafoundation
start /wait installers/mf/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe mf_
start /wait installers/mf/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe mfreadwrite
start /wait installers/mf/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe wmadmod
start /wait installers/mf/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe wmvdecod
start /wait installers/mf/windows6.1-kb976932-x64_74865ef2562006e51d7f9333b4a8d45b7a749dab.exe wmadmod
start /wait regedit.exe installers/mf/mf.reg
start /wait regedit.exe installers/mf/wmf.reg
start /wait regsvr32 colorcnv.dll
start /wait regsvr32 msmpeg2adec.dll
start /wait regsvr32 msmpeg2vdec.dll

echo NVIDIA PhysX...
start /wait installers/physx/PhysX_9.09.0428_SystemSoftware.exe /quiet

echo Visual C++ Redistributable packages...
start /wait installers/vcredist/vcredist_x64.exe /passive /norestart

goto END

:END

cscript ui/MessageBox.vbs "Installation was completed successfully!"

exit