@echo off
rem 日本語はシフトJISで保存
setlocal
pushd "%~dp0"

if not exist python\tools\python.exe (
    call 02_pyinst.cmd
)
set PATH=%CD%\python\tools;%CD%\python\tools\Scripts;%PATH%
cmd /k python --version

:exit
popd
endlocal
exit /b 0
