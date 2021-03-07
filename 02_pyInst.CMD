@echo off
rem 日本語はシフトJISで保存
setlocal
pushd "%~dp0"

if EXIST tmp (
    RD /S /Q tmp
)
if NOT EXIST tmp MD tmp
set tmp=%CD%\tmp

call :get_nuget
call :Install_python
call :Install_pip
call :pip_install -U pip
call :pip_install -U setuptools
call :pip_install -U jupyterlab
call :pip_install -U pandas
call :pip_install -U matplotlib
call :pip_install -U wxPython
call :pip_install -U simplequi
call :pip_install -U pyautoqui
call :pip_install -U opencv_python
call :pip_install -U python-dateutil pytz

:exit
popd
endlocal
exit /b 0

:get_nuget
call :wget "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe" "%TMP%\nuget.exe"
exit /b 0

:Install_python
IF EXIST python (
    RD /s /q python
)
"%TMP%\nuget.exe" locals all -clear
rem "%TMP%\nuget.exe" install python -NoCache -ExcludeVersion 
"%TMP%\nuget.exe" install python -NoCache -ExcludeVersion -Version 3.8.6
set PATH=%CD%\python\tools;%CD%\python\tools\Scripts;%PATH%
python --version
exit /b 0

:Install_pip
call :wget "https://bootstrap.pypa.io/get-pip.py" "%TMP%\get-pip.py"
python "%TMP%\get-pip.py"
exit /b 0

:pip_install 
python -m pip install --no-cache-dir %*
exit /b 0

:wget
rem echo 1:%1
rem echo 2:%2
powershell Invoke-WebRequest -Uri "%1" -OutFile "%2"
exit /b 0
