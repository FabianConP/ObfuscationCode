Class ObfDownloadFile2 {

    static Execute ([String]$url, [String]$path) {
        (New-Object System.Net.WebClient).DownloadFile($url, $path)
    }

}