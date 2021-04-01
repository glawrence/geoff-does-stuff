# The .NET Assembly for the Presentation Framework, required for Show()
Add-Type -AssemblyName PresentationFramework

# Pipe to Out-Null to suppress the outputting of OK
[System.Windows.MessageBox]::Show('Asking about Current Directory....') | Out-Null


$MsgBoxResult = [System.Windows.MessageBox]::Show('Path: ' + (Get-Location).Path, 'Current Directory', 'YesNoCancel', 'Info')

switch ($MsgBoxResult) {
	'Yes' {
		Write-Host 'Yes: so carry on and do that'
	}
	'No' {
		Write-Host 'No: don''t do that!'
	}
	'Cancel' { # this happens if you close the dialog or press escape
		Write-Host 'Cancel: abort or similar'
	}
}
