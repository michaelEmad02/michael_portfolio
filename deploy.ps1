param (
    [string]$msg = "Update portfolio website"
)

Write-Host "🚀 [1/4] Committing source code to main branch..." -ForegroundColor Cyan
git add .
git commit -m $msg
git push origin main

Write-Host "🔨 [2/4] Building Flutter Web for GitHub Pages..." -ForegroundColor Cyan
flutter build web --release --base-href "/michael_portfolio/"

Write-Host "📄 [3/4] Setting up 404.html and .nojekyll..." -ForegroundColor Cyan
Copy-Item "build\web\index.html" "build\web\404.html" -Force
New-Item -ItemType File -Path "build\web\.nojekyll" -Force | Out-Null

Write-Host "🌐 [4/4] Deploying to GitHub Pages (gh-pages branch)..." -ForegroundColor Cyan
Push-Location "build\web"
git add .
git commit -m "Deploy: $msg"
git push origin gh-pages --force
Pop-Location

Write-Host "`n✅ Successfully deployed! Your site is live at:" -ForegroundColor Green
Write-Host "👉 https://michaelemad02.github.io/michael_portfolio/`n" -ForegroundColor Yellow
