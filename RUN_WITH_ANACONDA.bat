@echo off
title FireSense - Anaconda Python
color 0A

echo ========================================================================
echo              FIRESENSE - Running with Anaconda Python
echo ========================================================================
echo.

cd /d "%~dp0"

echo [1] Activating Anaconda base environment...
call C:\Users\User\anaconda3\Scripts\activate.bat base
if errorlevel 1 (
    echo [WARNING] Could not activate conda environment
    echo Trying to run with Anaconda Python directly...
    echo.
)

echo [2] Installing packages in Anaconda environment...
pip install Flask Flask-SQLAlchemy pymysql

echo.
echo [3] Starting FireSense...
echo.
echo ========================================================================
echo                    FIRESENSE SERVER STARTING
echo ========================================================================
echo.
echo Open browser: http://localhost:5000
echo Login: admin / admin123
echo.
echo Press CTRL+C to stop
echo ========================================================================
echo.

python app.py

echo.
echo ========================================================================
echo Server stopped. Press any key to exit...
pause >nul
