# Invoke-WebRequest returns a BasicHtmlWebResponseObject, which when converted to a string returns the response body, or content
# The ConvertFrom-Json parses the data into an array of objects
# The option "-ProgressAction SilentlyContinue" is used to suppress progress display, it requires PowerShell 7.4 or later

$JsonObjects = Invoke-WebRequest -Uri "https://api.github.com/repos/microsoft/terminal/releases" -ProgressAction SilentlyContinue | ConvertFrom-Json
foreach ($release in $JsonObjects) {
	if ($release.prerelease) {
		Write-Output "Checking $($release.tag_name) '$($release.name)' (Pre-Release)..."
	} else {
		Write-Output "Checking $($release.tag_name) '$($release.name)'..."
	}
	foreach ($asset in $release.assets) {
		$AssetName = $asset.name
		# Exclude Zip files
		if (-Not $AssetName.EndsWith(".zip")) {
			Write-Host "  - $($AssetName)"
		}
	}
}
