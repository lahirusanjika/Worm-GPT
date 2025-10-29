@echo off
title WormGPT Installer

echo ======================================
echo     WormGPT Installer for Windows
echo ======================================

:: Check for Git
echo [~] Checking for Git...
git --version >nul 2>nul
if %errorlevel% neq 0 (
    echo [!] Git is not installed or not in PATH.
    echo [!] Please install Git from https://git-scm.com/download/win and try again.
    pause
    exit /b
)
echo [+] Git found.

:: Check for Python
echo [~] Checking for Python...
python --version >nul 2>nul
if %errorlevel% neq 0 (
    echo [!] Python is not installed or not in PATH.
    echo [!] Please install Python from https://www.python.org/downloads/ and make sure to check "Add Python to PATH".
    pause
    exit /b
)
echo [+] Python found.

:: Clone the repository
if exist "Worm-GPT" (
    echo [!] Worm-GPT directory already exists. Skipping clone.
) else (
    echo [+] Cloning Worm-GPT repository...
    git clone https://github.com/lahirusanjika/Worm-GPT
)

cd Worm-GPT

:: Install Python requirements
echo [+] Installing required python packages...
python -m pip install -r requirements.txt

echo.
echo ======================================
echo       Installation Complete!
echo ======================================
echo To run WormGPT, run this command in this terminal:
echo.
echo python WormGPT.py
echo.
echo Don't forget to get your API key from OpenRouter or DeepSeek!
echo ======================================
pause
