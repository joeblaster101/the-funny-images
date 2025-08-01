@echo off


git --version > nul 2>&1
if %errorlevel% neq 0 (
    echo Git is not installed or not available in the PATH.
    exit /b 1
)


set current_dir=%cd%


if exist "%current_dir%\.git" (

  for /f "delims=" %%i in ('git status --porcelain') do set "changes=%%i"
  if "%changes%"=="" (
    echo No changes to commit in %current_dir%
  ) else (

    echo Committing changes in %current_dir%
    git add .
    git commit -m "Auto commit"
  )

  echo Running git pull in %current_dir%
  git pull

  for /f "delims=" %%i in ('git status --porcelain') do set "changes=%%i"
  if "%changes%"=="" (
    echo No changes to commit after pull in %current_dir%
  ) else (

    echo Committing changes after pull in %current_dir%
    git add .
    git commit -m "Auto commit after pull"
  )
) else (
  echo %current_dir% is not a git repository
)
