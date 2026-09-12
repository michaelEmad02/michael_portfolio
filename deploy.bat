@echo off
setlocal

set "MSG=%~1"
if "%MSG%"=="" set "MSG=Update portfolio website"

echo [1/4] Committing source code to main branch...
git add .
git commit -m "%MSG%"
git push origin main

echo [2/4] Building Flutter Web for GitHub Pages...
call flutter build web --release --base-href "/michael_portfolio/"

echo [3/4] Setting up 404.html and .nojekyll...
copy /Y "build\web\index.html" "build\web\404.html" >nul
type nul > "build\web\.nojekyll"

echo [4/4] Deploying to GitHub Pages (gh-pages)...
cd "build\web"
git add .
git commit -m "Deploy: %MSG%"
git push origin gh-pages --force
cd ..\..

echo.
echo =======================================================
echo   Done! Your website is updated live at:
echo   https://michaelemad02.github.io/michael_portfolio/
echo =======================================================
echo.
