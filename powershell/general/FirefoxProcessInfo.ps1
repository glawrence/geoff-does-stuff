$TotalFirefoxWorkingSet = 0
$TotalFirefoxThreads = 0
$FullFirefoxDescription = ""
$FirefoxStartTime = Get-Date

$Logging = $false
$FirefoxInfoLogFile = "FirefoxLog.txt"

$FirefoxProcesses = Get-Process | Where-Object Name -eq "Firefox"
if ($FirefoxProcesses.count -gt 0) {
	$FullFirefoxDescription = "$($FirefoxProcesses[0].Description) $($FirefoxProcesses[0].ProductVersion.PadRight(6))" # padding to 6 copes with 67.0.1
	Write-Host "Found $($FirefoxProcesses.count) processes for $($FullFirefoxDescription)"
}

ForEach ($FfProcess in $FirefoxProcesses) {
	$FirefoxWS = $FfProcess.WorkingSet64
	$FirefoxWSKB = $FirefoxWS/1024
	$FirefoxWSMB = $FirefoxWSKB/1024
	$TotalFirefoxWorkingSet = $TotalFirefoxWorkingSet + $FirefoxWS

	$TotalFirefoxThreads += $FfProcess.Threads.Count

	if ($FfProcess.StartTime -lt $FirefoxStartTime) {
		$FirefoxStartTime = $FfProcess.StartTime
	}

	Write-Host "   WS: $($FirefoxWSKB.ToString('#,###').PadLeft(10)) KB $($FirefoxWSMB.ToString('#,###').PadLeft(6)) MB - PID: $($FfProcess.ID.ToString('#####').PadLeft(5)) - Threads: $($FfProcess.Threads.Count)"
}

if ($TotalFirefoxWorkingSet -gt 0) {
	$TotalWSMB = $TotalFirefoxWorkingSet/1024/1024
	Write-Host "Totals for Firefox processes:"
	Write-Host "  Start Time: $($FirefoxStartTime.ToString("yyyy-MM-dd HH:mm:ss"))"
	Write-Host "  Working Set: $($TotalWSMB.ToString('#,###.00')) MB"
	Write-Host "  Processes: $($FirefoxProcesses.count)"
	Write-Host "  Threads: $($TotalFirefoxThreads.ToString('#,###'))"
	if ($Logging) {
		$LogMessage = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
		$LogMessage += " : $($FullFirefoxDescription) - Working Set: $($TotalWSMB.ToString('#,###.00')) MB, Threads: $($TotalFirefoxThreads.ToString('#,###')), Processes: $($FirefoxProcesses.Count), Started: $($FirefoxStartTime.ToString("yyyy-MM-dd HH:mm:ss"))"
		Add-Content -Path $FirefoxInfoLogFile -Value $LogMessage
	}
} else {
	Write-Host "No Firefox processes found"
}
