using namespace System.Management.Automation.Language;

Class Obfuscator {

    static Execute ($scriptBlock) {
        Write-Host ($scriptBlock.GetType());
        #Write-Host $scriptBlock.ast.FindAll({$args[0] -is [CommandAst]}, $true);
        $stringConstantExpressions = $scriptBlock.ast.FindAll({$args[0] -is [StringConstantExpressionAst]}, $true);
        foreach($stringConstantExpression in $stringConstantExpressions){
            if($stringConstantExpression.ToString() -eq "Write-Host"){
                Write-Host "'$stringConstantExpression' -- can be replaced by'echo' -- ";
                $extent = $stringConstantExpression.Extent;
                Write-Host $extent
            }else{
                Write-Host $stringConstantExpression.ToString();
            }
        }
    }


}