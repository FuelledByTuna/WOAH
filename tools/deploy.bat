@echo off
rem usage: deploy.bat "<workspace folder>"
call "%~dp0config.bat"
set "WS=%~1"

rem Everything in package\ (dll, ini, pex...) -> game Data.
robocopy "%WS%\package" "%GAME_DIR%\Data" /E /XD Source /XF *.pdb *.log /NFL /NDL /NJH /NJS
if %ERRORLEVEL% GEQ 8 exit /b 1
echo Deploy done.
exit /b 0