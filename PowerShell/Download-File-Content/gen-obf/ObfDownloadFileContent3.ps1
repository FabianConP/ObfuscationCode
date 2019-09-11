Class ObfDownloadFileContent3 {

    static Execute ([String]$url) {
        #CLI:  Memory\PsWebString\Rearrange\3
        Set-Variable s $url;Set-Variable k 'Net.WebClient';Set-Variable h (New-Object (GCI Variable:k).Value);SI Variable:e9z 'DownloadString';
        Write-Host (Item Variable:\h).Value.((Variable e9z).Value).Invoke((Variable s).Value)
    }

}