# Custom PowerShell scripts

List of PowerShell scripts to be scanned by Windows Defender. Scripts can be imported using `Import-Module SCRIPT` or `ipmo SCRIPT` under PowerShell. 

* Obfuscated can be executed using `[SCRIPT]::Execute(params)`.
* Non-Obfuscated scripts can be executed using `SCRIPT` followed by its parameters.

## Scripts

- Create-File : Creates a file in a given path,  it can be also hidden. 
- Add-Persistence-Command : Adds a registry key under HKCU to execute a PowerShell command.
- Add-Persistence-Script : Adds a registry key under HKCU to execute a PowerShell local script.
- Download-File : Downloads a file from a URL to a given path. 
- Download-File-Content : Downloads file content from a URL into a file or stdout.
- Download-File-Content-Execute : Downloads file content from a URL and stores it as a PowerShell script in registry keys.
- Persistence-Execute-Script-Web : Executes web files from a registry key.
- Persistence-Execute-Script-Local : Executes a PowerShell local script from a registry key.