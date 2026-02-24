@echo off
title FireSense - Hotel Fire Safety System
color 0A

echo ========================================================================
echo    _____  _           ____                       
echo   ^|  ___^|(_) _ __   / ___|   ___  _ __   ___   ___ 
echo   ^| ^|_   ^| ^|^| '__^| ^| ^|  _   / _ \^| '_ \ / __^| / _ \
echo   ^|  _^|  ^| ^|^| ^|    ^| ^|_^| ^| ^|  __/^| ^| ^| ^|\__ \^|  __/
echo   ^|_^|    ^|_^|^|_^|     \____^|  \___^|^|_^| ^|_^|^|___/ \___^|
echo.
echo        Hotel Fire Safety Equipment Management System
echo ========================================================================
echo.

echo [*] Starting FireSense Application...
echo.

REM Change to the application directory
cd /d "%~dp0"

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python is not installed or not in PATH!
    echo Please install Python 3.x from https://www.python.org/
    pause
    exit /b 1
)

echo [OK] Python detected
echo.

REM Check if required packages are installed
echo [*] Checking required packages...
pip show Flask >nul 2>&1
if errorlevel 1 (
    echo [WARNING] Flask not found. Installing required packages...
    pip install Flask Flask-SQLAlchemy pymysql
    if errorlevel 1 (
        echo [ERROR] Failed to install packages!
        pause
        exit /b 1
    )
)

echo [OK] All packages installed
echo.

REM Check if MySQL is running
echo [*] Checking MySQL connection...
echo.

REM Start the Flask application
echo ========================================================================
echo [*] Starting FireSense Server...
echo ========================================================================
echo.
echo Press CTRL+C to stop the server
echo.

python app.py

REM If app exits, pause to see any errors
if errorlevel 1 (
    echo.
    echo ========================================================================
    echo [ERROR] Application stopped with errors!
    echo ========================================================================
    pause
)
