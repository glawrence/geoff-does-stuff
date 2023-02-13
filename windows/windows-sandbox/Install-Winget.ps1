# PowerShell script that will run in a Windows Sandbox and install WinGet

$ProgressPreference='SilentlyContinue'
Invoke-WebRequest -Uri https://github.com/microsoft/winget-cli/releases/download/v1.4.10173/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -OutFile .\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
Invoke-WebRequest -Uri https://www.nuget.org/api/v2/package/Microsoft.UI.Xaml/2.7.3 -OutFile Microsoft.UI.Xaml.2.7.3.zip
Expand-Archive -Path Microsoft.UI.Xaml.2.7.3.zip -DestinationPath Microsoft.UI.Xaml.2.7.3 -Force

Add-AppxPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -DependencyPath Microsoft.VCLibs.x64.14.00.Desktop.appx, .\Microsoft.UI.Xaml.2.7.3\tools\AppX\x64\Release\Microsoft.UI.Xaml.2.7.appx
