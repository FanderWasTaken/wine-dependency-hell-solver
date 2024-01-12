@echo Installing: K-Lite Mega Codec Pack
@REM Changing working directory to location of installer:
@cd /D "%~dp0"
@REM Alternatively, you can specify the full paths to both .exe and .ini file
@"K-Lite_Codec_Pack.exe" /VERYSILENT /NORESTART /SUPPRESSMSGBOXES /LOADINF="klcp.ini"
@echo Done!
