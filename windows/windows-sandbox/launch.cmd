@ECHO OFF

REM By default this script is run with C:\Windows\System32 as the current working directory
REM The current working directory is the same when PowerShell is launched from this script
REM In addition the Command Prompt window is hidden, so any text output is not visible

REM This script will switch the setup to English, as per script in ./powershell/general
REM it will then download and install Firefox Nightly, but do so silently

REM NOTE: this launch.cmd file and UserSettings-English.ps1 need to do placed in the correct
REM       location as specified in the .wsb file, so D:\Sandbox

TITLE Converting to UK setup
PUSHD %USERPROFILE%\Desktop\Sandbox
PowerShell.exe -ExecutionPolicy Bypass -File "UserSettings-English.ps1"
POPD

TITLE Download & Install Firefox Nightly
PUSHD %USERPROFILE%\Downloads
curl --location "https://download.mozilla.org/?product=firefox-nightly-latest-l10n-ssl&os=win64&lang=en-GB" --output FirefoxNightly.exe
FirefoxNightly.exe /s
POPD

TITLE Ready
