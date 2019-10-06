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
        return $Word;
    }
        
    static [String] JoinObfuscation([String] $Word){
        [Int] $WordLength = $Word.Length;
        if($WordLength -ge 8){
            [Object[]] $JoinTypes = "({0},{1}-join'')","(-join({0},{1}))"
            [String] $JoinType = [Utility]::pickOneRandom($JoinTypes)
            return $JoinType -f [StringObfuscator]::SplitIntoQuotedObfStrings($Word, 2)
        }
        return $Word;
    }


    static [String] FormatObfuscation([String] $Word){
        [Int] $WordLength = $Word.Length;
        if($WordLength -ge 8){
            [Object[]] $SplittedQuotedWordsObf = [StringObfuscator]::SplitIntoQuotedObfStrings($Word, 2)
            return "(`"{1}{0}`"-f " + ("{0},{1})" -f $SplittedQuotedWordsObf[1], $SplittedQuotedWordsObf[0])
        }
        return $Word;
    }

    static [String] Base64Obfuscation([String] $Word){
        [Int] $WordLength = $Word.Length;
        if($WordLength -ge 8){
            [String] $Content = $Word.Substring(1, $WordLength - 2)
            [String] $Base64String = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($Content))
            return "[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('{0}'))" -f $Base64String
        }
        return $Word;
        
    }

    ## [END] Obfuscation techniques


    static [String] quoteString($Word, $QuoteType){
        return "$QuoteType$Word$QuoteType";
    }


    static [Object[]] SplitIntoQuotedStrings([String] $Word, [Int] $Splits){
        [Int] $WordLength = $Word.Length;
        [String] $Content = $Word.Substring(1, $WordLength - 2)
        [Int] $ContentLength = $Content.Length;

        $SplitSizes =  @();
        $SplitMeanSize = [int] ($ContentLength / $Splits);
        $ContentSizeUsed = 0;
        for($i = 1; $i -lt $Splits; $i++){
            $SplitSize = Get-Random -Minimum 1 -Maximum $SplitMeanSize
            $SplitSizes += ,$SplitSize
            $ContentSizeUsed += $SplitSize
        }
        $SplitSizes += ,($ContentLength - $ContentSizeUsed)

        # Shuffle split sizes
        $SplitSizes = $SplitSizes | Sort-Object {Get-Random}

        $SplitQuotedStrings = @();
        $SplitOffSet = 0;
        foreach($SplitSize in $SplitSizes){
            $ContentSubstring = $Content.Substring($SplitOffSet, $SplitSize).Replace("`'","-")
            $SplitQuotedStrings += ,("`'" + $ContentSubstring + "`'") 
            $SplitOffSet += $SplitSize
        }
        return $SplitQuotedStrings;

    }

    static [Object[]] SplitIntoQuotedObfStrings([String] $Word, [Int] $Splits){
        [Object[]] $SplittedQuotedWords = [StringObfuscator]::SplitIntoQuotedStrings($Word, 2)
        return $SplittedQuotedWords | % {[StringObfuscator]::Obfuscate($_)}
    }



}