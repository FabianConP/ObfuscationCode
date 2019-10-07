Using module ".\Utility.psm1"

Class StringObfuscator{

    static [String] Obfuscate([String] $Word){
        $ObfuscationTechniques =  @();
        $ObfuscationTechniques += [StringObfuscator]::ConcatenationObfuscation
        $ObfuscationTechniques += [StringObfuscator]::JoinObfuscation
        $ObfuscationTechniques += [StringObfuscator]::FormatObfuscation
        $ObfuscationTechniques += [StringObfuscator]::Base64Obfuscation

        # Pick one random obfuscation technique
        $ObfTechnique = [Utility]::pickOneRandom($ObfuscationTechniques)
        return $ObfTechnique.Invoke($Word);
    }


    ## [BEGIN] Obfuscation techniques
    
    static [String] ConcatenationObfuscation([String] $Word){
        [Int] $WordLength = $Word.Length;
        if($WordLength -ge 6){
            [Object[]] $SplittedQuotedWordsObf = [StringObfuscator]::SplitIntoQuotedObfStrings($Word, 2)
            return "(" + $SplittedQuotedWordsObf[0] + "+" + $SplittedQuotedWordsObf[1] + ")"
        }
        return [StringObfuscator]::TerminalNode($Word)
    }
        
    static [String] JoinObfuscation([String] $Word){
        [Int] $WordLength = $Word.Length;
        if($WordLength -ge 8){
            [Object[]] $JoinTypes = "({0},{1}-join'')","(-join({0},{1}))"
            [String] $JoinType = [Utility]::pickOneRandom($JoinTypes)
            return $JoinType -f [StringObfuscator]::SplitIntoQuotedObfStrings($Word, 2)
        }
        return [StringObfuscator]::TerminalNode($Word)
    }


    static [String] FormatObfuscation([String] $Word){
        [Int] $WordLength = $Word.Length;
        if($WordLength -ge 8){
            [Object[]] $SplittedQuotedWordsObf = [StringObfuscator]::SplitIntoQuotedObfStrings($Word, 2)
            return "(`"{1}{0}`"-f " + ("{0},{1})" -f $SplittedQuotedWordsObf[1], $SplittedQuotedWordsObf[0])
        }
        return [StringObfuscator]::TerminalNode($Word)
    }

    static [String] Base64Obfuscation([String] $Word){
        [Int] $WordLength = $Word.Length;
        if($WordLength -ge 8){
            #[String] $Content = $Word.Substring(1, $WordLength - 2)
            [String] $Base64String = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($Word))
            return "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String({0}))" -f [StringObfuscator]::TerminalNode($Base64String)
        }
        return [StringObfuscator]::TerminalNode($Word)
        
    }

    ## [END] Obfuscation techniques

    
    static [String] TerminalNode([String] $Word){
        return "`"" + [StringObfuscator]::SanetizeWord($Word) + "`"";
    }

    static [String] SanetizeWord([String] $Word){
        $Word = $Word.Replace('"',"`'")
        $Word = $Word.Replace('.',"`.")
        return $Word
    }
    
    static [Object[]] SplitIntoQuotedStrings([String] $Word, [Int] $Splits){
        [Int] $WordLength = $Word.Length;

        $SplitSizes =  @();
        $SplitMeanSize = [int] ($WordLength / $Splits);
        $ContentSizeUsed = 0;
        for($i = 1; $i -lt $Splits; $i++){
            $SplitSize = Get-Random -Minimum 1 -Maximum $SplitMeanSize
            $SplitSizes += ,$SplitSize
            $ContentSizeUsed += $SplitSize
        }
        $SplitSizes += ,($WordLength - $ContentSizeUsed)

        # Shuffle split sizes
        $SplitSizes = $SplitSizes | Sort-Object {Get-Random}

        $SplitQuotedStrings = @();
        $SplitOffSet = 0;
        foreach($SplitSize in $SplitSizes){
            $WordSubstring = $Word.Substring($SplitOffSet, $SplitSize)
            $SplitQuotedStrings += ,$WordSubstring 
            $SplitOffSet += $SplitSize
        }
        return $SplitQuotedStrings;

    }

    static [Object[]] SplitIntoQuotedObfStrings([String] $Word, [Int] $Splits){
        [Object[]] $SplittedQuotedWords = [StringObfuscator]::SplitIntoQuotedStrings($Word, 2)
        return $SplittedQuotedWords | ForEach-Object {[StringObfuscator]::Obfuscate($_)}
    }
}