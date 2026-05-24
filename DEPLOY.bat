@echo off
title GM Studio — Deploy
color 0A
echo.
echo  ================================
echo   GM Studio Deploy Script
echo  ================================
echo.

cd /d "C:\Users\User\OneDrive\Desktop\gmstudio-site\gmstudio.github.io"

echo [1/4] Removendo locks do git...
del /f /q .git\index.lock 2>nul
del /f /q .git\HEAD.lock 2>nul

echo [2/4] Adicionando arquivos...
git add branding/index.html painel/index.html branding-content.json crm-tracker.js

echo [3/4] Commitando...
git commit -m "crm: leads capture, leads panel admin, export CSV, Visao panel, nav reorder"

echo [4/4] Fazendo push...
git push origin main

echo.
echo  ================================
echo   Push concluido!
echo  ================================
echo.
pause
