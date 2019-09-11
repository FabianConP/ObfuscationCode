Class ObfDownloadFileContent1 {

    static Execute ([String]$url) {
        # Downloads the file content
        [String] $FileContent = (New-Object System.Net.WebClient).DownloadString($url)

        # Prints in stdout the file content
        Write-Host $FileContent
    }

}