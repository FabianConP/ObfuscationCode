function Test-Execute-Commands-From-StdIn
{
<#
.SYNOPSIS
Custom Payload to execute powershell commands from standard input.

.DESCRIPTION
This payload executes powershell commands from standard input.

.EXAMPLE
PS > Test-Execute-Commands-From-StdIn

.LINK
https://github.com/FabianConP/ObfuscationCode
#>

    # Read input lines until it gets a "exit" command
    do {
        $cmd = Read-Host
        # Exit if user inputs 'exit'
        if ($cmd -eq 'exit') {
            Write-Host "Exiting"
            break
        }
        # Skip empty lines
        if($cmd.Trim().Length -eq 0) { continue; }
        try {
            $output = [string](Invoke-Expression $cmd)
        }
        catch {
            $output = $_.Exception.Message
        }
        Write-Host $output
        [Console]::Out.Flush() 
    } while($true)
}