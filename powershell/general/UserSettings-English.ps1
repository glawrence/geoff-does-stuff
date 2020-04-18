# If you add the same language to the list multiple times and then pass it to Set-WinUserLanguageList
# Windows will de-duplicate the list. The first entry in the list will become the default language.

function viewRegionalSettings {
	Write-Host "Current User location: " -NoNewline
	(Get-WinHomeLocation).HomeLocation
	Write-Host "Current User Language: " -NoNewline
	(Get-WinUserLanguageList)[0].LocalizedName
	checkTimeZoneIsUK
}

function userAddEnglishUKAsDefault {
	Write-Host "Changing time-zone, region and language to United Kingdom, English"
	Set-WinHomeLocation -GeoId 242 # Set current region for user to United Kingdom

	$list = Get-WinUserLanguageList
	$list.Insert(0, "en-GB")
	Set-WinUserLanguageList $list -Force
	changeToUKTimeZone
}

function userSetEnglishUKAsOnly {
	Write-Host "Changing time-zone, region and language to United Kingdom, English"
	Set-WinHomeLocation -GeoId 242 # Set current region for user to United Kingdom

	$list = New-WinUserLanguageList -Language "en-GB"
	Set-WinUserLanguageList $list -Force
	changeToUKTimeZone
}

function checkTimeZoneIsUK {
	$CurrentTZ = (Get-TimeZone).Id
	if ($CurrentTZ -eq "GMT Standard Time") {
		Write-Host "Running in UK Time Zone: $($CurrentTZ)"
	} else {
		Write-Host "Computer set to non-UK TimeZone [$($CurrentTZ)]"
	}
}

function changeToUKTimeZone {
	Set-TimeZone -Id "GMT Standard Time"
}

viewRegionalSettings
Write-Host
userSetEnglishUKAsOnly
# userAddEnglishUKAsDefault
Write-Host
viewRegionalSettings
