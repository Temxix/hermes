@echo off
title Hermes Agent - Telegram Gateway
echo Starting Hermes Agent Telegram Gateway...
echo.

set TERMINAL_CWD=
set MESSAGING_CWD=
set HERMES_TELEGRAM_DISABLE_FALLBACK_IPS=1

cd /d "%~dp0hermes_source_code\hermes-agent-main"

python -m gateway.run

if errorlevel 1 (
    echo.
    echo Hermes Agent exited with an error.
    pause
)
