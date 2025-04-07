# PowerShell 啟動腳本 for Gin + React
Write-Host "🚀 正在啟動 MyProject..."

# 關閉前端已開發的 port
try {
    Get-Process -Id (Get-NetTCPConnection -LocalPort 3000).OwningProcess | Stop-Process -Force
    Write-Host "🛑 已關閉佔用 3000 port 的進程"
} catch {
    Write-Host "✅ port 3000 未被佔用"
}

# 啟動 React 前端（開新視窗）
Start-Process powershell -ArgumentList "cd ./frontend; npm start"

# 延遲 2 秒，避免 race condition
Start-Sleep -Seconds 2

# 啟動後端 Gin Server（在目前視窗）
Write-Host "🌐 啟動 Gin 伺服器..."
go run ./backend/main.go
