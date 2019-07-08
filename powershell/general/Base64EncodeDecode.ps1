Function Base64Encode($InputText) {
	return [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($InputText))
}

Function Base64Decode($InputText) {
	return [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($InputText))
}


# using some previously encoded text
$EncodedText = 'WW91IGNhbm5vdCBiZWF0IGEgbmljZSBwaWVjZSBvZiBQb3dlclNoZWxsIQ=='
Write-Host "Encoded  : $EncodedText"

# decode the text and display it
$DecodedText = Base64Decode $EncodedText
Write-Host "Decoded  : $DecodedText"

# take the decoded text and encode it, then see if it matches the original
$ReEncodedText = Base64Encode $DecodedText
Write-Host "ReEncoded: $ReEncodedText"
Write-Host "Is the re-encoded text the same as the orginal? $($ReEncodedText -eq $EncodedText)"
