@echo off
setlocal enabledelayedexpansion

echo ================================================
echo Gradle Wrapper Setup for Windows
echo ================================================

echo.
echo Step 1: Downloading Gradle 8.4 (this may take a few minutes)...
echo.

REM Create temp directory
if not exist "temp_gradle" mkdir temp_gradle
cd temp_gradle

REM Download Gradle
powershell -Command "Write-Host 'Downloading from: https://services.gradle.org/distributions/gradle-8.4-bin.zip'; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://services.gradle.org/distributions/gradle-8.4-bin.zip' -OutFile 'gradle-8.4-bin.zip' -Verbose"

if not exist "gradle-8.4-bin.zip" (
    echo ERROR: Download failed!
    cd ..
    pause
    exit /b 1
)

echo Download completed successfully!
echo.
echo Step 2: Extracting Gradle...
powershell -Command "Expand-Archive -Path 'gradle-8.4-bin.zip' -DestinationPath '.' -Force"

if not exist "gradle-8.4" (
    echo ERROR: Extraction failed!
    cd ..
    pause
    exit /b 1
)

echo Extraction completed successfully!
echo.
echo Step 3: Copying gradle-wrapper-8.4.jar...

REM Check if gradle-wrapper-8.4.jar exists
if exist "gradle-8.4\lib\plugins\gradle-wrapper-8.4.jar" (
    echo Found gradle-wrapper-8.4.jar!
    if not exist "..\gradle\wrapper" mkdir ..\gradle\wrapper
    copy "gradle-8.4\lib\plugins\gradle-wrapper-8.4.jar" "..\gradle\wrapper\gradle-wrapper.jar"
    echo Copied successfully!
) else (
    echo ERROR: gradle-wrapper-8.4.jar not found in extraction!
    cd ..
    pause
    exit /b 1
)

echo.
echo Step 4: Cleaning up...
cd ..
rmdir /s /q temp_gradle

echo.
echo ================================================
echo Setup completed successfully!
echo ================================================
echo.
echo You can now run your project with:
echo   gradlew.bat run
echo.
pause
