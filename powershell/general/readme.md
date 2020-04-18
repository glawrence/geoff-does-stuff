## Executing Scripts

By default PowerShell 5.1 will need something like the following executing before you can execute PowerShell scripts (.ps1 files) from the PowerShell console. With PowerShell 7 and above this is not the case.

`Set-ExecutionPolicy -Scope Process Bypass`