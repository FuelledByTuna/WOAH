@echo off
rem usage: compile_all_papyrus.bat "<workspace folder>"
setlocal
set "WS=%~1"
for /r "%WS%\package\Scripts\Source\User" %%f in (*.psc) do call "%~dp0compile_papyrus.bat" "%%f" "%WS%"
