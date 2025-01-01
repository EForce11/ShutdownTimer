@echo off

:menu
cls
echo 1. Set the shutdown timer
echo 2. Cancel shutdown
echo.
set /p selection="Please select a process (1 or 2): "

if "%selection%"=="1" goto shutdown_set
if "%selection%"=="2" goto shutdown_cancel

echo.
echo Invalid option! Please select 1 or 2.
timeout /nobreak /t 3 >nul
goto menu

:shutdown_set
set /p minute_second="Enter the shutdown time in minutes:seconds (e.g, 2:30): "

echo.
rem Divide the entered time into minutes and seconds
for /f "tokens=1,2 delims=:" %%a in ("%minute_second%") do (
  set minute=%%a
  set second=%%b
)

rem Convert the entered minutes and seconds to seconds
set /a total_second=(minute*60)+second

shutdown /s /t %total_second%
goto finish

:shutdown_cancel
shutdown /a
goto finish

:finish
