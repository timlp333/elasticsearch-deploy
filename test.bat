@echo off
chcp 65001
setlocal enabledelayedexpansion

set COUNTER=1
for /f %%i in (%HOSTFILE%) do (
    echo %COUNTER%
    set /A COUNTER+=1
)
pause