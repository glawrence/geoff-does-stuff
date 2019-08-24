Set-Variable -Name OutputFile -Value "report.csv"

Function GenerateFileWithDate($OutputFileName, $WithTime = $false) {
	if ($WithTime) {
		$DateFormat = '_yyyyMMdd_HHmmss'
	} else {
		$DateFormat = '_yyyyMMdd'
	}
	$TheDate = Get-Date -Format $DateFormat
	Write-Host "Inserting date element: [$($TheDate)]"
	$OutputFileName = $OutputFileName.Insert($OutputFileName.LastIndexOf('.'), $TheDate)
	Write-Host "Actual filename: $($OutputFileName)"
	Remove-Item -Path $OutputFileName -Force -ErrorAction:Ignore
	Add-Content -Path $OutputFileName "This is some text inside the file"
}

GenerateFileWithDate $OutputFile
GenerateFileWithDate $OutputFile $true