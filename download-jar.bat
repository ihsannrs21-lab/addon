@echo off
setlocal enabledelayedexpansion

echo ================================================
echo Gradle Wrapper JAR Download
echo ================================================
echo.

REM Download gradle-wrapper.jar directly from Gradle Services
echo Downloading gradle-wrapper.jar from Gradle Services...
echo.

if not exist "gradle\wrapper" mkdir gradle\wrapper

powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://services.gradle.org/wrapper/gradle-wrapper-8.4.jar' -OutFile 'gradle\wrapper\gradle-wrapper.jar' -Verbose"

if exist "gradle\wrapper\gradle-wrapper.jar" (
    echo.
    echo SUCCESS! gradle-wrapper.jar has been downloaded.
    echo You can now run: gradlew.bat run
) else (
    echo.
    echo ERROR: Failed to download gradle-wrapper.jar
    echo Please try again or download manually from:
    echo https://services.gradle.org/wrapper/gradle-wrapper-8.4.jar
)

echo.
pause
