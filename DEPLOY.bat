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
taskkill /f /im git.exe 2>nul
taskkill /f /im git-remote-https.exe 2>nul
timeout /t 1 /nobreak >nul
attrib -r .git\index.lock 2>nul
attrib -r .git\HEAD.lock 2>nul
del /f /q .git\index.lock 2>nul
del /f /q .git\HEAD.lock 2>nul
del /f /q .git\refs\heads\main.lock 2>nul
del /f /q .git\MERGE_HEAD 2>nul
del /f /q .git\CHERRY_PICK_HEAD 2>nul

echo [2/4] Adicionando arquivos...
git add index.html branding/index.html briefing/index.html painel/index.html
git add site-content.json branding-content.json briefing-content.json portfolio.json
git add crm-tracker.js DEPLOY.bat SUPABASE_LEADS.sql README.md

echo [3/4] Commitando...
git commit -m "fix: toolbar rich-text em campos HTML do painel + audit completo" --allow-empty

echo [4/4] Fazendo push...
git push origin main

echo.
echo  ================================
echo   Push concluido!
echo  ================================
echo.
pause
