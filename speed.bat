chcp 65001
if "%prog%"=="1" goto sh

echo MTOS %ver% %edition%
if %build%==alpha echo Alpha build 
if %build%==beta echo Beta build 
if %build%==unofficial echo Unofficial build by: %builder%.
echo.
echo Type help for commands.
cd prog
if exist %shell%.bat (
    goto sh
) else (
    goto error
)


:sh
echo.
echo.
%shell%

:error
set errorcode=SHELL_NOT_FOUND
%error%