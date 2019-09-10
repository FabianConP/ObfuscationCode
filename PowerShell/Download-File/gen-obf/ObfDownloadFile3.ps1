Class ObfDownloadFile3 {

    static Execute ([String]$url, [String]$path) {
        #CLI:  Disk\PsWebFile\Rearrange\3
        Set-Item Variable:\U7T (New-Object Net.WebClient);Set-Item Variable:7 $url;SI Variable:\zc $path;(Item Variable:\U7T).Value.DownloadFile((LS Variable:\7).Value,(GV zc -Va))
    }
}