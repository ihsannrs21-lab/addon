@echo off
echo Downloading Gradle 8.4...
powershell -Command "Invoke-WebRequest -Uri 'https://services.gradle.org/distributions/gradle-8.4-bin.zip' -OutFile 'gradle-8.4-bin.zip'"

echo Extracting Gradle...
powershell -Command "Expand-Archive -Path 'gradle-8.4-bin.zip' -DestinationPath '.' -Force"

echo Copying gradle-wrapper.jar...
if not exist "gradle\wrapper" mkdir gradle\wrapper
copy "gradle-8.4\lib\plugins\gradle-wrapper.jar" "gradle\wrapper\gradle-wrapper.jar"

echo Cleaning up...
rmdir /s /q gradle-8.4
del gradle-8.4-bin.zip

echo Done! Now run: gradlew.bat run
pause
