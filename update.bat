@echo off

:: Check if git is installed and available in the PATH
git --version > nul 2>&1
if %errorlevel% neq 0 (
    echo Git is not installed or not available in the PATH.
    exit /b 1
)

:: Run git pull
echo Running git pull in %cd%
git pull
