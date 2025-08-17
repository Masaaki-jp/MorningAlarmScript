# ================================
# Windows Media Player で MP3 を再生
# ================================

# --- 設定項目 ---
# 再生したい音楽ファイルのパスをここに指定してください。
$musicFile = "C:\パス\to\あなたの\音楽ファイル.mp3"

# 再生したい時間を秒単位で指定してください。
# 例：5分30秒の場合は「330」と入力
$playTimeSeconds = 300
# --- 設定項目ここまで ---


# Windows Media Player のパス（通常は変更不要）
$wmpPath = "C:\Program Files (x86)\Windows Media Player\wmplayer.exe"

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
