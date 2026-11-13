# 把 islands.csv 轉成網頁可直接載入的 islands_data.js（直接雙擊 index.html 時使用）
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$csv = Get-Content -Raw -Encoding UTF8 (Join-Path $here 'islands.csv')
$js = 'window.ISLANDS_CSV = ' + (ConvertTo-Json $csv -Compress) + ';'
[IO.File]::WriteAllText((Join-Path $here 'islands_data.js'), $js, (New-Object Text.UTF8Encoding($false)))
Write-Host '已產生 islands_data.js'
