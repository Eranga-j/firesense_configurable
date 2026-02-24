@echo off
title FireSense - Setup & Installation
color 0B

echo ========================================================================
echo                    FIRESENSE - SETUP WIZARD
echo ========================================================================
echo.
echo This will install all required Python packages for FireSense
echo.
echo Required packages:
echo   - Flask (Web Framework)
echo   - Flask-SQLAlchemy (Database)
echo   - pymysql (MySQL Connector)
echo.
pause

cd /d "%~dp0"

echo ========================================================================
echo STEP 1: Checking Python Installation
echo ========================================================================
echo.

python --version
if errorlevel 1 (
    echo.
    echo [ERROR] Python is not installed!
    echo.
    echo Please install Python 3.8 or higher from:
    echo https://www.python.org/downloads/
    echo.
    echo IMPORTANT: Check "Add Python to PATH" during installation
    echo.
    pause
    exit /b 1
)

echo.
echo [OK] Python is installed
echo.

echo ========================================================================
echo STEP 2: Installing Required Packages
echo ========================================================================
echo.
echo Installing Flask and dependencies...
echo This may take a few minutes...
echo.

pip install Flask
if errorlevel 1 (
    echo [ERROR] Failed to install Flask
    pause
    exit /b 1
)

pip install Flask-SQLAlchemy
if errorlevel 1 (
    echo [ERROR] Failed to install Flask-SQLAlchemy
    pause
    exit /b 1
)

pip install pymysql
if errorlevel 1 (
    echo [ERROR] Failed to install pymysql
    pause
    exit /b 1
)

pip install cryptography
if errorlevel 1 (
    echo [WARNING] Failed to install cryptography (optional)
)

echo.
echo [OK] All packages installed successfully!
echo.

echo ========================================================================
echo STEP 3: Verifying Installation
echo ========================================================================
echo.

python -c "import flask; print('[OK] Flask version:', flask.__version__)"
python -c "import flask_sqlalchemy; print('[OK] Flask-SQLAlchemy installed')"
python -c "import pymysql; print('[OK] pymysql installed')"

echo.
echo ========================================================================
echo STEP 4: Database Check
echo ========================================================================
echo.
echo IMPORTANT: Make sure MySQL is running!
echo.
echo In XAMPP Control Panel:
echo   1. Start Apache (optional, for phpMyAdmin)
echo   2. Start MySQL (REQUIRED!)
echo   3. Import firesense_hotel.sql database
echo.
echo Press any key when MySQL is ready...
pause

echo.
echo ========================================================================
echo STEP 5: Starting FireSense Application
echo ========================================================================
echo.
echo Starting server...
echo.
echo Open your browser and go to: http://localhost:5000
echo.
echo Login credentials:
echo   Username: admin
echo   Password: admin123
echo.
echo Press CTRL+C to stop the server
echo ========================================================================
echo.

python app.py

if errorlevel 1 (
    echo.
    echo ========================================================================
    echo [ERROR] Application failed to start!
    echo ========================================================================
    echo.
    echo Common issues:
    echo   1. MySQL is not running - Start MySQL in XAMPP
    echo   2. Database not imported - Import firesense_hotel.sql
    echo   3. Wrong database credentials - Check app.py line 8
    echo.
    pause
)

exit /b 0
