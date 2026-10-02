@echo off
chcp 65001 >nul
title Instalador del pack de mods de Balatro
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0windows\Instalar_Windows.ps1"
if errorlevel 1 (
  echo.
  echo [ERROR] La instalacion no se completo. Lee el mensaje de arriba.
)
echo.
pause
