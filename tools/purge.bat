@echo off
rem usage: purge.bat "<workspace folder>"
rem Removes this mod's deployed files from the game's Data folder.
rem Does NOT touch your project or the build folder.
setlocal enabledelayedexpansion
call "%~dp0config.bat"
set "WS=%~1"
set "PKG=%WS%\package"

echo Removing this mod's files from: %GAME_DIR%\Data

rem 1) everything that exists in package\ (except Papyrus sources) -> remove its copy in the game
for /r "%PKG%" %%f in (*) do call :delone "%%f"

rem 2) known files by name, in case they are no longer in package\
del /q "%GAME_DIR%\Data\F4SE\Plugins\%PLUGIN_NAME%.dll" 2>nul
del /q "%GAME_DIR%\Data\F4SE\Plugins\%PLUGIN_NAME%.ini" 2>nul
del /q "%GAME_DIR%\Data\F4SE\Plugins\%PLUGIN_NAME%.pdb" 2>nul
del /q "%GAME_DIR%\Data\F4SE\Plugins\%PLUGIN_NAME%.ini.log" 2>nul

echo Purge done.
goto :eof

:delone
set "P=%~1"
if not "!P:\Source\=!"=="!P!" goto :eof
set "REL=!P:%PKG%\=!"
if exist "%GAME_DIR%\Data\!REL!" del /q "%GAME_DIR%\Data\!REL!" & echo Removed !REL!
goto :eof
