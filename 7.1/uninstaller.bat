echo ───────────────────────────┐
echo Godzina: %time%
echo ──────────────────┬────────┘
echo UNINSTALLER       │
echo ──────────────────┘
rem     │     ─   └    ┘    ┌    ┐    ┤    ├    ┼    ┴    ┬
:start
set syspkgdel=0
echo Witaj w uninstaller! (Version 2.1HOTFIX)
echo FIXED VERSION - 30.08.2024
echo Podaj nazwe pakietu który chcesz usunąć! UWAGA: ABY ZACHOWAĆ STABILNOŚĆ SYSTEMU NIE USUWAJ PAKIETÓW SYSTEMOWYCH. 
set /p rmpkg=Pkg_name:
if  %rmpkg%==* (
    goto warning2
) else (
    goto check2
)
:check2
if  %rmpkg%==MTOS_SHELL (
    goto warning
) else (
    goto check3
)
:check3
if exist %rmpkg%.bat (
    goto uninstall
) else (
    echo invalid choose && goto exit
)

:warning
cls
echo Uwaga, ten pakiet jest plikiem WYMAGANYM do uruchomienia systemu. CZY NAPEWNO CHCESZ GO USUNĄĆ?
set /p choose=[y/n]: 
if %choose%==y set syspkgdel=1 && goto uninstall
if %choose%==n goto exit
echo invalid choose.
goto warning

:warning2
cls
echo Uwaga, UWAGA USUWASZ WSZYSTKIE PAKIETY! SPOWODUJE TO USZKODZENIE SYSTEMU I KONIECZNOŚĆ JEGO NAPRAWY! CZY NAPEWNO CHCESZ JE USUNĄĆ?
set /p choose=[y/n]: 
if %choose%==y set syspkgdel=1 && goto uninstall
if %choose%==n goto exit
echo invalid choose.
goto warning2

:uninstall
del %rmpkg%.bat /q
echo PAKIET ODINSTALOWANY POMYŚLNIE!
pause
goto exit

:exit
if %syspkgdel%==1 set errorcode=SYSTEM_FILES_NOT_FOUND && call %crash%
set prog=1
%shell%
