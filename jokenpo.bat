@echo off

:inicio
title MENU
mode 117, 34
color 0f

cls
echo =====================================================================================================================
echo.
echo      _________________                                                             ____             ______
echo      \                ^|                                                           /  _ \           ^|      ^|
echo       \_____       ___^|            __   __                ____       __          /__/ \_\          ^|      ^|
echo             ^|     ^|     ______    ^|  ^| /  ^|    ______    ^|    \__   ^|  \____      ______      _____^|      ^|_____
echo             ^|     ^|    /   _  \   ^|  ^|/  /    /  _   \   ^|   _   ^|  ^|    _  \    /   _  \    ^|                  ^|
echo      ____   ^|     ^|   ^|   / \  ^|  ^|     \    ^|  /_\ __^|  ^|  ^| ^|  ^|  ^|   / \  ^|  ^|   / \  ^|   ^|                  ^|
echo     ^|    \__^|     ^|   ^|   \_/  ^|  ^|  ^|\  \   ^|     /__   ^|  ^| ^|  ^|  ^|   \_/  ^|  ^|   \_/  ^|   ^|_____        _____^|
echo     ^|             ^|    \______/   ^|__^| \__^|   \______/   ^|__^| ^|__^|  ^|   ____/    \______/          ^|      ^|
echo      \           /                                                  ^|  ^|                           ^|      ^|
echo       \_________/                                                   ^|__^|                           ^|______^|
echo.
echo.
echo =====================================================================================================================
echo.
echo             [1] Jogar
echo.
echo             [2] Regras
echo.
echo             [3] Sair
echo.
echo =====================================================================================================================
echo.
set /p op=^|    Insira a opcao desejada: 

if %op% equ 1 (goto:nome)
if %op% equ 2 (goto:regras)
if %op% equ 3 (exit) else (
echo.
echo =====================================================================================================================
echo.
echo                                                     Opcao invalida!
echo.
echo =====================================================================================================================
echo.
pause
goto:inicio)


:regras
title REGRAS
mode 94, 39
color 0f

cls
echo ==============================================================================================
echo.
echo          ______________                                                                  
echo          \       ____  \                                                                 
echo           ^|     ^|    \  \                      __                                        
echo           ^|     ^|     ^|  ^|    ______      ____/  ^|   __   __     ______      ______      
echo           ^|     ^|____/  /    /  _   \    /   _   ^|  ^|  ^|_/  ^|   /   _  \    /    __\     
echo           ^|      _    _/    ^|  /_\ __^|  ^|   / \  ^|  ^|    ___^|  ^|   / \  ^|  ^|__   \__     
echo           ^|     ^| \   \     ^|     /__   ^|   \_/  ^|  ^|   /      ^|   \_/  ^|   __/     ^|    
echo           ^|     ^|  \   \     \______/    \_____  ^|  ^|__^|        \____/\_^|   \______/     
echo           ^|     ^|   \   \               / \___/  ^|                                       
echo           ^|_____^|    \___\              \_______/                                        
echo.
echo.
echo ==============================================================================================
echo.
echo                                            [PEDRA]
echo     GANHA de TESOURA e LAGARTO   ^|    EMPATA com PEDRA    ^|   PERDE para PAPEL e SPOCK
echo.
echo.
echo                                            [PAPEL]
echo         GANHA de PEDRA e SPOCK   ^|    EMPATA com PAPEL    ^|   PERDE para TESOURA e LAGARTO
echo.
echo.
echo                                           [TESOURA]
echo       GANHA de PAPEL e LAGARTO   ^|   EMPATA com TESOURA   ^|   PERDE para PAPEL e SPOCK
echo.
echo.
echo                                           [LAGARTO]
echo         GANHA de PAPEL e SPOCK   ^|   EMPATA com LAGARTO   ^|   PERDE para PEDRA e TESOURA
echo.
echo.
echo                                            [SPOCK]
echo       GANHA de PEDRA e TESOURA   ^|    EMPATA com SPOCK    ^|   PERDE para PAPEL e LAGARTO
echo.
echo ==============================================================================================
echo.
pause
goto:inicio

:nome
title JOKENPO^+
mode 71, 31

set /a totalEmpates=0
set /a placarJogador=0
set /a placarMaquina=0

cls
echo =======================================================================
echo.
set /p nome=^|    Insira seu nome: 
echo.
echo =======================================================================
goto:jogo

:jogo
title JOKENPO^+
mode 71, 33
color 0f

:randomizar
set /a escMaquinaNum=(%random% %% 5) + 1
if %escMaquinaNum% equ 6 (goto:randomizar)

if %escMaquinaNum% equ 1 (set escMaquinaNome=PEDRA)
if %escMaquinaNum% equ 2 (set escMaquinaNome=PAPEL)
if %escMaquinaNum% equ 3 (set escMaquinaNome=TESOURA)
if %escMaquinaNum% equ 4 (set escMaquinaNome=LAGARTO)
if %escMaquinaNum% equ 5 (set escMaquinaNome=SPOCK)

cls
echo =======================================================================
echo.
echo                             _________________        ______
echo     [1] PEDRA               \                ^|      ^|      ^|
echo.                             \_____       ___^|      ^|      ^|
echo     [2] PAPEL                      ^|     ^|     _____^|      ^|_____
echo.                                   ^|     ^|    ^|                  ^|
echo     [3] TESOURA             ____   ^|     ^|    ^|                  ^|
echo.                           ^|    \__^|     ^|    ^|_____        _____^|
echo     [4] LAGARTO            ^|             ^|          ^|      ^|
echo.                            \           /           ^|      ^|
echo     [5] SPOCK                \_________/            ^|______^|
echo.
echo.
echo =======================================================================
rem echo Maquina escolheu %escMaquinaNum% (%escMaquinaNome%)
echo.
set /p escJogadorNum=^|    Insira a opcao desejada: 
echo.

if %escJogadorNum% equ 1 (goto:pedra)
if %escJogadorNum% equ 2 (goto:papel)
if %escJogadorNum% equ 3 (goto:tesoura)
if %escJogadorNum% equ 4 (goto:lagarto)
if %escJogadorNum% equ 5 (goto:spock) else (
echo =======================================================================
echo.
echo                              Opcao invalida!
echo.
echo =======================================================================
echo.
pause
goto:jogo)

:pedra
set escJogadorNome=PEDRA
if %escMaquinaNum% equ 1 (set result=0)
if %escMaquinaNum% equ 2 (set result=2)
if %escMaquinaNum% equ 3 (set result=1)
if %escMaquinaNum% equ 4 (set result=2)
if %escMaquinaNum% equ 5 (set result=1)
goto:resultado

:papel
set escJogadorNome=PAPEL
if %escMaquinaNum% equ 1 (set result=1)
if %escMaquinaNum% equ 2 (set result=0)
if %escMaquinaNum% equ 3 (set result=2)
if %escMaquinaNum% equ 4 (set result=2)
if %escMaquinaNum% equ 5 (set result=1)
goto:resultado

:tesoura
set escJogadorNome=TESOURA
if %escMaquinaNum% equ 1 (set result=2)
if %escMaquinaNum% equ 2 (set result=1)
if %escMaquinaNum% equ 3 (set result=0)
if %escMaquinaNum% equ 4 (set result=1)
if %escMaquinaNum% equ 5 (set result=2)
goto:resultado

:lagarto
set escJogadorNome=LAGARTO
if %escMaquinaNum% equ 1 (set result=2)
if %escMaquinaNum% equ 2 (set result=1)
if %escMaquinaNum% equ 3 (set result=2)
if %escMaquinaNum% equ 4 (set result=0)
if %escMaquinaNum% equ 5 (set result=1)
goto:resultado

:spock
set escJogadorNome=SPOCK
if %escMaquinaNum% equ 1 (set result=1)
if %escMaquinaNum% equ 2 (set result=2)
if %escMaquinaNum% equ 3 (set result=1)
if %escMaquinaNum% equ 4 (set result=2)
if %escMaquinaNum% equ 5 (set result=0)
goto:resultado

:resultado
echo =======================================================================
echo.
echo     %nome% escolheu %escJogadorNome%
echo                                     VS
echo                                           Computador escolheu %escMaquinaNome%
echo.
echo                                  . . . .

if %result% equ 0 (
set /a totalEmpates=%totalEmptates% + 1
echo                                   EMPATE!)

if %result% equ 1 (
set /a placarJogador=%placarJogador% + 1
color 0a
echo                                  VITORIA!)

if %result% equ 2 (
set /a placarMaquina=%placarMaquina% + 1
color 04
echo                                  DERROTA!)

echo.
echo =======================================================================
echo.
echo                    [Insira P para visualizar o placar]
echo.

:jogarNovamente
set /p op=^|    Deseja jogar novamente^? [S/N]: 

if /i %op% equ s (goto:jogo)
if /i %op% equ n (goto:inicio)
if /i %op% equ p (goto:placar) else (
echo =======================================================================
echo.
echo                             Opcao invalida!
echo.
echo =======================================================================
echo.
goto:jogarNovamente)

:placar
title PLACAR
color 0f
mode 84, 24

echo ====================================================================================
echo     ______________                                                                  
echo     \       ____  \     ___
echo      ^|     ^|    \  \   \   ^|
echo      ^|     ^|     ^|  ^|   ^|  ^|         ______      ______      ______     __   __
echo      ^|     ^|____/  /    ^|  ^|        /   _  \    /   ___\    /   _  \   ^|  ^|_/  ^|
echo      ^|      ______/     ^|  ^|____   ^|   / \  ^|  ^|   /       ^|   / \  ^|  ^|    ___^|
echo      ^|     ^|            ^|       ^|  ^|   \_/  ^|  ^|   \___    ^|   \_/  ^|  ^|   /
echo      ^|     ^|            \______/    \____/\_^|   \______/    \____/\_^|  ^|__^|
echo      ^|     ^|
echo      ^|_____^|
echo.
echo ====================================================================================
echo.
echo     %nome%: %placarJogador%
echo.
echo     Computador: %placarMaquina%
echo.
echo     Empates: %totalEmpates%
echo.
echo ===================================================================================
echo.
pause
goto:jogo