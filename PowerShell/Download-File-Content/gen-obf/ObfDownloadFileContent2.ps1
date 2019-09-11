Class ObfDownloadFileContent2 {

    static Execute([String]$url) {
        #CLI:  Memory\PsWebString\Rearrange\2
        $wc2='Net.WebClient';$wc=(New-Object $wc2);$ds='DownloadString';
        Write-Host $wc.$ds.Invoke($url);
    }

}