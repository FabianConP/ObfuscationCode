Class ObfDownloadFileContent7 {

    static Execute ([String]$url) {
        #CLI:  Memory\PsWebString\Method\3
        Write-Host (New-Object Net.WebClient).((((New-Object Net.WebClient)|GM)|Where{$_.Name-clike'D*g'}).Name).Invoke($url)
    }

}