@echo off
rem usage: compile_papyrus.bat "<full path to .psc>" "<workspace folder>"
call "%~dp0config.bat"
set "FILE=%~1"
set "WS=%~2"
set "SRC=%WS%\package\Scripts\Source\User"
set "OUT=%WS%\package\Scripts"
set "PC=%GAME_DIR%\Papyrus Compiler\PapyrusCompiler.exe"
if not exist "%PC%" set "PC=PapyrusCompiler"
if not exist "%OUT%" mkdir "%OUT%"

"%PC%" "%FILE%" -f="%GAME_DIR%\Data\Scripts\Source\Base\Institute_Papyrus_Flags.flg" -i="%SRC%;%GAME_DIR%\Data\Scripts\Source\User;%GAME_DIR%\Data\Scripts\Source\Base;%GAME_DIR%\Data\Scripts\Source" -o="%OUT%"
