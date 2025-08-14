# ================================
# Windows Media Player で MP3 を再生
# ================================

# Windows Media Player のパス
$wmpPath = "C:\Program Files (x86)\Windows Media Player\wmplayer.exe"

# 再生する音楽ファイルのパス
$musicFile = "C:\Users\Masaaki\Music\HY - AM11_00 (Official Music Video).mp3"

# 再生時間（秒）
$playTimeSeconds = 325

# WMP を起動して MP3 を再生
Write-Host "Windows Media Player で音楽を再生します..."
$process = Start-Process -FilePath $wmpPath -ArgumentList "`"$musicFile`"" -PassThru

# 指定時間待機
Write-Host "$playTimeSeconds 秒間待機..."
Start-Sleep -Seconds $playTimeSeconds

# WMP を終了
Write-Host "Windows Media Player を終了します..."
try {
    Stop-Process -Id $process.Id -Force
} catch {
    Write-Host "プロセスが見つかりませんでした。既に閉じたかもしれません。"
}

Write-Host "スクリプト完了！"
