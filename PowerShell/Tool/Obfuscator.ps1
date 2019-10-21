Using module '.\Visitor.psm1'

Function Obfuscate-Script {
<#

.PARAMETER ScriptBlock
    The ScriptBlock to be measured.

    
.PARAMETER Path

    The Path to a script to be measured.
#>

[cmdletbinding(DefaultParameterSetName="ScriptBlock")]
    param(
        [parameter(Mandatory=$true,ParameterSetName="ScriptBlock")]
        [scriptblock]$ScriptBlock,
        [parameter(Mandatory=$true,ParameterSetName="Path")]
        [string]$Path
    )

    if($PSBoundParameters.Keys -icontains "Path") {
        if(-not (Test-Path $path)) {       
            throw "No such file"
        }
        $ScriptText = Get-Content $path -Raw 
        $ScriptBlock = [scriptblock]::Create($ScriptText)
    }

    $scriptBlock = [scriptblock]::Create($ScriptBlock.ToString())
    $visitor  = [Visitor]::new()
    $scriptBlock.Ast.Visit($visitor)
    Write-Host $visitor.NewCode.Content
}