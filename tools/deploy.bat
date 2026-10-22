@echo off
rem usage: deploy.bat "<workspace folder>"
call "%~dp0config.bat"
set "WS=%~1"
set "DLL=%WS%\build\windows\x64\release\%PLUGIN_NAME%.dll"

rem 1) package (ini, pex...) -> game Data. Papyrus sources, pdb and logs are left out.
robocopy "%WS%\package" "%GAME_DIR%\Data" /E /XD Source /XF *.pdb *.log /NFL /NDL /NJH /NJS

rem 2) built DLL -> game plugins folder
if not exist "%DLL%" goto nodll
copy /Y "%DLL%" "%GAME_DIR%\Data\F4SE\Plugins\" >nul
echo DLL copied.
goto done

:nodll
echo WARNING: %PLUGIN_NAME%.dll not found in build\windows\x64\release - run "DLL: build (Release)" first.

:done
echo Deploy done.
