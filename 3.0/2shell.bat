:sh
set prog=0
set template=Tryb_awaryjny:
set /p "cmd=%template% "

if not exist "%cmd%.bat" (
    echo Invalid command
    goto sh
) ELSE (
    %cmd%
)