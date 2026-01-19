@echo off
:: Ensure we're running in cmd.exe, not PowerShell
if defined PSHOME (
    cmd /c "%~f0" %*
    exit /b %errorlevel%
)

setlocal enabledelayedexpansion

cd /d "%~dp0"

:: ============================================
:: Step 0: Check required tools
:: ============================================
echo Checking required tools...

:: Check Docker
where docker >NUL 2>&1
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Docker is not installed!
    echo Install Docker Desktop: https://www.docker.com/products/docker-desktop
    exit /b 1
)

:: Check if Docker daemon is running
docker info >NUL 2>&1
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Docker daemon is not running!
    echo Please start Docker Desktop and try again.
    exit /b 1
)

:: Check Flutter
where flutter >NUL 2>&1
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Flutter is not installed!
    echo Install Flutter: winget install Flutter.Flutter
    exit /b 1
)

:: Check Dart
where dart >NUL 2>&1
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Dart is not installed!
    echo Dart should come with Flutter. Reinstall Flutter.
    exit /b 1
)

:: Check Git (needed for Flutter)
where git >NUL 2>&1
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Git is not installed!
    echo Install Git: winget install Git.Git
    exit /b 1
)

echo       All tools OK
echo.

:: ============================================
:: Step 0b: Pre-build cleanup
:: ============================================
echo Cleaning up previous build artifacts...

:: Remove build folder
if exist build rmdir /s /q build

:: Remove data folder
if exist data rmdir /s /q data

:: Remove .dart_tool folder
if exist .dart_tool rmdir /s /q .dart_tool

:: Remove windows/flutter/ephemeral
if exist windows\flutter\ephemeral rmdir /s /q windows\flutter\ephemeral

:: Remove Flutter generated files
if exist windows\flutter\generated_plugin_registrant.cc del /f windows\flutter\generated_plugin_registrant.cc
if exist windows\flutter\generated_plugin_registrant.h del /f windows\flutter\generated_plugin_registrant.h
if exist windows\flutter\generated_plugins.cmake del /f windows\flutter\generated_plugins.cmake

:: Remove Flutter plugin cache files
if exist .flutter-plugins del /f .flutter-plugins
if exist .flutter-plugins-dependencies del /f .flutter-plugins-dependencies

:: Remove libcore binaries
if exist libcore\bin\libcore.dll del /f libcore\bin\libcore.dll
if exist libcore\bin\xray-core.exe del /f libcore\bin\xray-core.exe

:: Remove generated Dart code
for /r lib %%f in (*.g.dart *.freezed.dart) do del /f "%%f" >NUL 2>&1

echo       Cleanup OK
echo.

:: ============================================
:: Read version from version.yaml
:: ============================================
set HIDDIFY_BASE=2.5.7
set YUMASH_VERSION=1.0.0

if exist version.yaml (
    for /f "tokens=2 delims=:" %%a in ('findstr /r "hiddify_base:" version.yaml') do (
        set HIDDIFY_BASE=%%a
        set HIDDIFY_BASE=!HIDDIFY_BASE: =!
        set HIDDIFY_BASE=!HIDDIFY_BASE:"=!
    )
    for /f "tokens=2 delims=:" %%a in ('findstr /r "yumash_version:" version.yaml') do (
        set YUMASH_VERSION=%%a
        set YUMASH_VERSION=!YUMASH_VERSION: =!
        set YUMASH_VERSION=!YUMASH_VERSION:"=!
    )
)

set VERSION=!HIDDIFY_BASE!-yumash-!YUMASH_VERSION!
set RELEASE_BASE=release\!VERSION!
set RELEASE_DIR=!RELEASE_BASE!\!VERSION!

echo ============================================
echo Hiddify Yumash Edition !VERSION!
echo ============================================
echo.

:: Xray-core version for XHTTP support
set XRAY_VERSION=v25.12.8

:: Step 1: Build libcore.dll in Docker
echo [1/7] Building libcore.dll in Docker...
echo       (this may take 5-10 minutes on first run)
echo.

cd libcore
if not exist bin mkdir bin

:: Remove old Docker image to ensure fresh build
echo Removing old Docker image (if exists)...
docker rmi hiddify-libcore-builder:latest 2>nul
echo.

docker build --no-cache -f Dockerfile.windows -t hiddify-libcore-builder .
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Docker build failed!
    exit /b 1
)

docker run --rm -v "%cd%\bin:/output" hiddify-libcore-builder cp /out/libcore.dll /output/
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Docker run failed!
    exit /b 1
)

if not exist bin\libcore.dll (
    echo.
    echo ERROR: libcore.dll not found!
    exit /b 1
)

echo       libcore.dll OK
echo.

:: Step 1b: Build xray-core.exe in Docker
echo [1b/7] Building xray-core.exe %XRAY_VERSION% in Docker...
echo.

docker build --no-cache -f Dockerfile.xray --build-arg XRAY_VERSION=%XRAY_VERSION% -t hiddify-xray-builder .
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Xray Docker build failed!
    exit /b 1
)

docker run --rm -v "%cd%\bin:/output" hiddify-xray-builder cp /xray-core.exe /output/
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Xray Docker run failed!
    exit /b 1
)

if not exist bin\xray-core.exe (
    echo.
    echo ERROR: xray-core.exe not found!
    exit /b 1
)

echo       xray-core.exe OK
echo.

:: Step 2: Prepare Flutter build
echo [2/7] Preparing Flutter build...
cd ..

:: Disable Dart/Flutter telemetry (suppress output)
call dart --disable-analytics >NUL 2>&1
call flutter config --no-analytics >NUL 2>&1

:: Step 3: Flutter build
echo [3/7] Building Flutter app...
echo.

:: Clean old build to remove stale dependencies and CMake cache
call flutter clean
if exist build rmdir /s /q build

call flutter pub get
if %errorlevel% neq 0 (
    echo.
    echo ERROR: flutter pub get failed!
    exit /b 1
)

echo       Generating code (build_runner)...
call dart run build_runner build --delete-conflicting-outputs
if %errorlevel% neq 0 (
    echo.
    echo ERROR: build_runner failed!
    exit /b 1
)

:: Flutter build (CMake INSTALL error is expected and ignored)
call flutter build windows --target=lib/main_prod.dart
set FLUTTER_EXIT=%errorlevel%

:: Check that exe was built (even if INSTALL step failed)
if not exist build\windows\x64\runner\Release\hiddify.exe (
    echo.
    echo ERROR: flutter build failed - hiddify.exe not found!
    exit /b 1
)

echo       Flutter build OK

:: Step 4: Assemble release folder
echo [4/7] Assembling release...

:: Validate RELEASE_DIR is set
if "!RELEASE_DIR!"=="" (
    echo ERROR: RELEASE_DIR is empty - version.yaml parsing failed
    exit /b 1
)

:: Create release directory
if not exist !RELEASE_DIR! mkdir !RELEASE_DIR!

:: Copy all files from build output
xcopy /E /Y /Q build\windows\x64\runner\Release\* !RELEASE_DIR!\ >NUL

:: Copy libcore.dll and xray-core.exe
copy /Y libcore\bin\libcore.dll !RELEASE_DIR!\ >NUL
copy /Y libcore\bin\xray-core.exe !RELEASE_DIR!\ >NUL

:: Copy plugin DLLs that CMake INSTALL did not copy
for /d %%D in (build\windows\x64\plugins\*) do (
    if exist "%%D\Release\*.dll" (
        copy /Y "%%D\Release\*.dll" !RELEASE_DIR!\ >NUL
    )
)

:: Copy sqlite3.dll separately (it's in a subdirectory)
if exist build\windows\x64\plugins\sqlite3_flutter_libs\Release\sqlite3.dll (
    copy /Y build\windows\x64\plugins\sqlite3_flutter_libs\Release\sqlite3.dll !RELEASE_DIR!\ >NUL
)

:: Copy version file for app to read
copy /Y version.yaml !RELEASE_DIR!\ >NUL

:: Step 5: Create ZIP archive
echo [5/7] Creating ZIP archive...

set ZIP_NAME=Hiddify-Yumash-!VERSION!-windows-x64.zip
set ZIP_PATH=!RELEASE_BASE!\!ZIP_NAME!

:: Remove old archive if exists
if exist "!ZIP_PATH!" del /f "!ZIP_PATH!"

:: Create ZIP using PowerShell (built-in on Windows 10+)
powershell -Command "Compress-Archive -Path '!RELEASE_DIR!\*' -DestinationPath '!ZIP_PATH!' -Force"
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Failed to create ZIP archive!
    exit /b 1
)

echo       !ZIP_NAME! OK

:: Step 6: Generate MD5 checksum
echo [6/7] Generating MD5 checksum...

set MD5_FILE=!RELEASE_BASE!\!ZIP_NAME!.md5

:: Generate MD5 using PowerShell (more reliable than certutil parsing)
powershell -NoProfile -Command "(Get-FileHash -Path '!ZIP_PATH!' -Algorithm MD5).Hash.ToLower() + '  !ZIP_NAME!' | Set-Content -Path '!MD5_FILE!' -NoNewline"
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Failed to generate MD5 checksum!
    exit /b 1
)

echo       !ZIP_NAME!.md5 OK

:: Step 7: Cleanup build artifacts
echo [7/7] Cleaning up build artifacts...

:: Remove build folder (large temp files, ~500 MB)
if exist build rmdir /s /q build

:: Remove data folder (Flutter build artifacts, ~12 MB)
if exist data rmdir /s /q data

:: Remove .dart_tool folder (Dart cache, ~50 MB)
if exist .dart_tool rmdir /s /q .dart_tool

:: Remove windows/flutter/ephemeral (Flutter SDK cache, ~230 MB)
if exist windows\flutter\ephemeral rmdir /s /q windows\flutter\ephemeral

:: Remove Flutter generated files in windows/flutter
if exist windows\flutter\generated_plugin_registrant.cc del /f windows\flutter\generated_plugin_registrant.cc
if exist windows\flutter\generated_plugin_registrant.h del /f windows\flutter\generated_plugin_registrant.h
if exist windows\flutter\generated_plugins.cmake del /f windows\flutter\generated_plugins.cmake

:: Remove Flutter plugin cache files
if exist .flutter-plugins del /f .flutter-plugins
if exist .flutter-plugins-dependencies del /f .flutter-plugins-dependencies

:: Remove libcore binaries (rebuilt each time from Docker)
if exist libcore\bin\libcore.dll del /f libcore\bin\libcore.dll
if exist libcore\bin\xray-core.exe del /f libcore\bin\xray-core.exe

:: Remove generated code (will be regenerated on next build)
for /r lib %%f in (*.g.dart *.freezed.dart) do del /f "%%f" >NUL 2>&1

:: NOTE: pubspec.lock is kept for reproducible builds

echo.
echo ============================================
echo BUILD COMPLETE! Hiddify Yumash Edition !VERSION!
echo ============================================
echo.
echo Release folder:
echo   %cd%\!RELEASE_DIR!\
echo.
echo Archive:
echo   %cd%\!ZIP_PATH!
echo.
echo MD5 checksum:
echo   %cd%\!MD5_FILE!
echo.
echo PORTABLE MODE: Extract ZIP anywhere
echo and run Hiddify.exe
echo Settings will be stored in portable_data\
echo.
