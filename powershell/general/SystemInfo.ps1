# This script needs to be running "As Admin" for Get-WindowsOptionalFeature to work

if ((Get-WindowsOptionalFeature -FeatureName 'Containers-DisposableClientVM' -Online).State) {
	Write-Host "Windows Sandbox is Enabled"
} else {
	Write-Host "Windows Sandbox is Disabled"
}

# This code will not work in PowerShell 6 or above, it needs Windows stuff
$WmiResult = Get-WmiObject -Class Win32_OperatingSystem -ComputerName localhost
$WmiResult.ConvertToDateTime($WmiResult.LastBootupTime)