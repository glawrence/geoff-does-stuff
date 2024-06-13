# Invoke-WebRequest returns a BasicHtmlWebResponseObject, but when -OutFile is used the response body is written to a file
# The option "-ProgressAction SilentlyContinue" is used to suppress progress display, it requires PowerShell 7.4 or later

$DownloadUrl = "https://download.mozilla.org/?product=firefox-nightly-latest-l10n-ssl&os=win64&lang=en-GB"
$DownloadFile = "FirefoxNightly.exe"
Write-Output "Downloading $($DownloadFile) from $($DownloadUrl)"
Invoke-WebRequest -Uri $DownloadUrl -Outfile $DownloadFile -ProgressAction SilentlyContinue
Get-ChildItem -Path $DownloadFile