@echo off
title FireSense - Fix & Run
color 0B

echo ========================================================================
echo                    FIRESENSE - FIX & RUN
echo ========================================================================
echo.
echo This will install Flask in your current Python environment
echo and start the application.
echo.

cd /d "%~dp0"

echo [1] Detecting Python...
echo.

REM Try to use Anaconda Python if available
if exist "C:\Users\User\anaconda3\python.exe" (
    echo Found Anaconda Python!
    echo Installing packages in Anaconda...
    echo.
    
    C:\Users\User\anaconda3\python.exe -m pip install Flask Flask-SQLAlchemy pymysql
    
    echo.
    echo Starting with Anaconda Python...
    echo.
    echo ========================================================================
    echo                         SERVER STARTING
    echo ========================================================================
    echo.
    echo Open browser: http://localhost:5000
    echo Login: admin / admin123
    echo.
    echo Press CTRL+C to stop
    echo ========================================================================
    echo.
    
    C:\Users\User\anaconda3\python.exe app.py
    
) else (
    echo Using system Python...
    echo Installing packages...
    echo.
    
    python -m pip install Flask Flask-SQLAlchemy pymysql
    
    echo.
    echo Starting application...
    echo.
    echo ========================================================================
    echo                         SERVER STARTING
    echo ========================================================================
    echo.
    echo Open browser: http://localhost:5000
    echo Login: admin / admin123
    echo.
    echo Press CTRL+C to stop
    echo ========================================================================
    echo.
    
    python app.py
)

echo.
echo ========================================================================
echo Server stopped. Press any key to exit...
pause >nul
