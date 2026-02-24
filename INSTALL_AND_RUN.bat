@echo off
title FireSense - Installation & Setup
color 0B

echo ========================================================================
echo               FIRESENSE - INSTALLATION WIZARD
echo ========================================================================
echo.
echo This will install all required packages and start FireSense
echo.

cd /d "%~dp0"

echo [STEP 1/4] Checking Python installation...
python --version
if errorlevel 1 (
    echo [ERROR] Python not found!
    echo Please install Python from https://www.python.org/
    pause
    exit /b 1
)
echo [OK] Python found
echo.

echo [STEP 2/4] Installing required packages...
pip install Flask Flask-SQLAlchemy pymysql
if errorlevel 1 (
    echo [ERROR] Package installation failed!
    pause
    exit /b 1
)
echo [OK] Packages installed
echo.

echo [STEP 3/4] Checking database...
echo Make sure MySQL is running and firesense_hotel database exists
echo.
pause

echo [STEP 4/4] Starting FireSense...
echo.
echo ========================================================================
echo                  FIRESENSE IS NOW RUNNING
echo ========================================================================
echo.
echo Open your browser and go to: http://localhost:5000
echo.
echo Login: admin
echo Password: admin123
echo.
echo Press CTRL+C to stop the server
echo ========================================================================
echo.

python app.py

pause
