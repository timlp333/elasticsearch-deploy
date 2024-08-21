@echo off
chcp 65001
setlocal enabledelayedexpansion
set HOSTFILE=hosts.txt
set COUNTER=1
set COUNTER2=1
for /f %%i in (%HOSTFILE%) do (
    echo !COUNTER!
    set /a COUNTER+=1
)

:loop
echo COUNTER2 is !COUNTER2!
set /a COUNTER2+=1

if !COUNTER2! leq 3 (
    goto loop
)
pause