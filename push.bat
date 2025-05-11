@echo off
REM Secure Git Push Script

REM Confirm current branch
FOR /F "tokens=*" %%i IN ('git branch --show-current') DO SET currentBranch=%%i
echo You are currently on branch: %currentBranch%
echo.

REM Confirm push
set /p confirm="Do you want to continue pushing to '%currentBranch%'? (y/n): "
if /I NOT "%confirm%"=="y" (
    echo Push canceled.
    pause
    exit /b
)

REM Enter commit message
echo Enter commit message:
set /p msg=

REM Basic commit message check
if "%msg%"=="" (
    echo Commit message cannot be empty. Aborting.
    pause
    exit /b
)

git add .
git commit -m "%msg%"
git push origin %currentBranch%

echo.
echo Push successful!
pause
