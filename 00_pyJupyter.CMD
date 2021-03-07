@echo off
rem 日本語はシフトJISで保存
setlocal
pushd "%~dp0"

if not exist python\tools\scripts\jupyter.exe (
    call 02_pyinst.cmd
)
set PATH=%CD%\python\tools;%CD%\python\tools\Scripts;%PATH%
if not exist scripts (
    md scripts
)
cd scripts
jupyter.exe lab 
:exit
popd
endlocal
exit /b 0
