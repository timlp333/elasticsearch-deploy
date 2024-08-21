set COUNTER=1
for /f %%i in (%HOSTFILE%) do (
    echo COUNTER
    set /A COUNTER=COUNTER+1
)