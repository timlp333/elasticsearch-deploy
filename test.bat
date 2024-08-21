@echo off
chcp 65001
setlocal enabledelayedexpansion
set HOSTFILE=hosts.txt
set COUNTER=1
@REM for /f %%i in (%HOSTFILE%) do (
@REM     echo %COUNTER%
@REM     set /a COUNTER+=1
@REM )

:loop
echo COUNTER is !COUNTER!
set /a COUNTER+=1

if !COUNTER! leq 3 (
    goto loop
)
pause