# This script needs to be running "As Admin"

if ((Get-WindowsOptionalFeature -FeatureName 'Containers-DisposableClientVM' -Online).State) {
	Write-Host "Windows Sandbox is Enabled"
} else {
	Write-Host "Windows Sandbox is Disabled"
}