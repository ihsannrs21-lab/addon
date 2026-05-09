@echo off
setlocal enabledelayedexpansion

echo ================================================
echo Gradle Wrapper JAR Download
echo ================================================
echo.

echo Downloading gradle-wrapper.jar from Gradle Services...
echo.

if not exist "gradle\wrapper" mkdir gradle\wrapper

powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; $ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri 'https://services.gradle.org/wrapper/gradle-wrapper-8.4.jar' -OutFile 'gradle\wrapper\gradle-wrapper.jar'"

if exist "gradle\wrapper\gradle-wrapper.jar" (
    for %%A in ("gradle\wrapper\gradle-wrapper.jar") do (
        set SIZE=%%~zA
    )
    echo.
    echo SUCCESS! gradle-wrapper.jar downloaded ^(!SIZE! bytes^)
    echo You can now run: gradlew.bat run
) else (
    echo.
    echo ERROR: Failed to download gradle-wrapper.jar
)

echo.
pause
