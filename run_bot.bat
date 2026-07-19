@echo off
chcp 65001 > nul
title Hermes Agent - Telegram Gateway

echo ===================================================
echo               HERMES AGENT LAUNCHER               
echo ===================================================
echo.

set "SCRIPT_DIR=%~dp0"
set "HERMES_DIR=%SCRIPT_DIR%hermes_source_code\hermes-agent-main"

if not exist "%HERMES_DIR%" (
    echo [ERROR] Папка исходного кода Hermes не найдена: %HERMES_DIR%
    pause
    exit /b 1
)

cd /d "%HERMES_DIR%"

echo [INFO] Запуск Hermes Agent Telegram Gateway...
echo.
python -m gateway.run

if errorlevel 1 (
    echo.
    echo [ERROR] Бот завершил работу с ошибкой.
    pause
)
