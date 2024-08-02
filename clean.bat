@echo off
color 0A
title Windows Cleanup Utility

:menu
cls
echo =====================================
echo       Windows Cleanup Utility
echo =====================================
echo [1] Clean Temp folders
echo [2] Clean Prefetch
echo [3] Clean Recycle Bin
echo [4] Optimize System
echo [5] Repair System Files (SFC)
echo [6] Check and Repair Disk Errors (CHKDSK)
echo [7] Disk Cleanup
echo [8] Defragment Disk
echo [9] Run All
echo [0] Exit
echo =====================================
set /p choice=Choose an option: 

if "%choice%"=="1" goto clean_temp
if "%choice%"=="2" goto clean_prefetch
if "%choice%"=="3" goto clean_recyclebin
if "%choice%"=="4" goto optimize_system
if "%choice%"=="5" goto repair_system_files
if "%choice%"=="6" goto check_repair_disk
if "%choice%"=="7" goto disk_cleanup
if "%choice%"=="8" goto defrag_disk
if "%choice%"=="9" goto run_all
if "%choice%"=="0" goto exit

:clean_temp
echo Cleaning Temp folders...
del /q /f /s %temp%\*
pause
goto menu

:clean_prefetch
echo Cleaning Prefetch...
del /q /f /s C:\Windows\Prefetch\*
pause
goto menu

:clean_recyclebin
echo Cleaning Recycle Bin...
rd /s /q C:\$Recycle.Bin
pause
goto menu

:optimize_system
echo Optimizing System...
:: Add optimization commands here
pause
goto menu

:repair_system_files
echo Repairing System Files...
sfc /scannow
pause
goto menu

:check_repair_disk
echo Checking and Repairing Disk Errors...
chkdsk /f /r
pause
goto menu

:disk_cleanup
echo Running Disk Cleanup...
cleanmgr /sageset:1
cleanmgr /sagerun:1
pause
goto menu

:defrag_disk
echo Defragmenting Disk...
defrag C: /O
pause
goto menu

:run_all
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

:exit
exit
