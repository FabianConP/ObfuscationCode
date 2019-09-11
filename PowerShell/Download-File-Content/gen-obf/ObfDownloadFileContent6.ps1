Class ObfDownloadFileContent6 {

    static Execute ([String]$url) {
        #CLI:  Memory\PsWebString\Method\2
        Write-Host (New-Object Net.WebClient).(((((New-Object Net.WebClient)).PsObject.Methods)|Where{(Get-Variable _).Value.Name-clike'D*g'}).Name).Invoke($url)
    }

}