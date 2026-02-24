@echo off
title Installing Flask...
color 0E

echo Installing FireSense packages...
echo.

cd /d "%~dp0"

echo [1/4] Installing Flask...
pip install Flask

echo [2/4] Installing Flask-SQLAlchemy...
pip install Flask-SQLAlchemy

echo [3/4] Installing pymysql...
pip install pymysql

echo [4/4] Installing cryptography...
pip install cryptography

echo.
echo ========================================================================
echo Installation Complete!
echo ========================================================================
echo.
echo Now you can run START_FIRESENSE.bat
echo.
pause
