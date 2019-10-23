Using module '.\StringHelper.psm1'
Using module '.\StringObfuscator.psm1'
Using module '.\Tokens.psm1'

class Visitor : System.Management.Automation.Language.ICustomAstVisitor,
                System.Management.Automation.Language.ICustomAstVisitor2
{
    [StringHelper] $NewCode

    Visitor() {
        $this.NewCode = [StringHelper]::new()
    }

    VisitElement([object] $element) {
        if ($element -ne $null) {
            $element.Visit($this)
        }
    }

    VisitElements([System.Object]$elements) { 
        $this.VisitElements($elements, "")
    }

    VisitElements([System.Object[]]$elements, [String] $separator) { 
        if ($elements -ne $null){
            For($i = 0; $i -lt $elements.Length; $i++){
                If($i -ne 0){
                    $this.NewCode.NoSpace().Append($separator)
                }
                $this.VisitElement($elements[$i])
            }
        }
    }

    VisitStatements([System.Object] $statements){
        if ($statements -ne $null){
            foreach($statement in $statements) {
                $this.VisitElement($statement)
                $this.NewCode.NewLine()
            }
        }
    }

    [system.object] VisitArrayExpression([System.Management.Automation.Language.ArrayExpressionAst] $statement){
        $this.NewCode.Append("@").NoSpace().Append("(")
        $this.VisitElement($statement.SubExpression)
        $this.NewCode.Append(")")
        return $statement
    }
    
    [system.object] VisitArrayLiteral([System.Management.Automation.Language.ArrayLiteralAst] $statement){
        $this.VisitElements($statement.Elements, ",")
        return $statement
    }
    
    [system.object] VisitAssignmentStatement([System.Management.Automation.Language.AssignmentStatementAst] $statement){
        $this.VisitElement($statement.Left)
        $this.NewCode.Append("=")
        $this.VisitElement($statement.Right)
        return $statement
    }
    
    [system.object] VisitAttribute([System.Management.Automation.Language.AttributeAst] $statement){
        $this.NewCode.Append("[").Append($statement.Typename.Name).Append("(")
        $this.VisitElements($statement.NamedArguments, ",")
        $this.NewCode.Append(")").Append("]")
        return $statement
    }
    
    [system.object] VisitAttributedExpression([System.Management.Automation.Language.AttributedExpressionAst] $statement){
        return $statement
    }

    [system.object] VisitBaseCtorInvokeMemberExpression([System.Management.Automation.Language.BaseCtorInvokeMemberExpressionAst] $statement){
        return $statement
    }
    
    [system.object] VisitBinaryExpression([System.Management.Automation.Language.BinaryExpressionAst] $statement){
        $this.VisitElement($statement.Left)
        $token = [Tokens]::Kind[$statement.Operator.ToString()]
        $this.NewCode.Append($token)
        $this.VisitElement($statement.Right)
        return $statement
    }
    
    [system.object] VisitBlockStatement([System.Management.Automation.Language.BlockStatementAst] $statement){
        return $statement
    }
    
    [system.object] VisitBreakStatement([System.Management.Automation.Language.BreakStatementAst] $statement){
        return $statement
    }
    
    [system.object] VisitCatchClause([System.Management.Automation.Language.CatchClauseAst] $statement){
        return $statement
    }
    
    [system.object] VisitCommand([System.Management.Automation.Language.CommandAst] $statement){
        If($statement.InvocationOperator){
            $token = [Tokens]::Kind[$statement.InvocationOperator.ToString()]
            $this.NewCode.Append($Token).NoSpace()
        }
        $this.VisitElements($statement.CommandElements)
        return $statement
    }
    
    [system.object] VisitCommandExpression([System.Management.Automation.Language.CommandExpressionAst] $statement){
        $this.VisitElement($statement.Expression)
        return $statement
    }
    
    [system.object] VisitCommandParameter([System.Management.Automation.Language.CommandParameterAst] $statement){
        $this.NewCode.Append("-").NoSpace().Append($statement.ParameterName)
        return $statement
    }

    [system.object] VisitConfigurationDefinition([System.Management.Automation.Language.ConfigurationDefinitionAst] $statement){
        return $statement
    }
    
    [system.object] VisitConstantExpression([System.Management.Automation.Language.ConstantExpressionAst] $statement){
        $this.NewCode.Append($statement.ToString())
        return $statement
    }
    
    [system.object] VisitContinueStatement([System.Management.Automation.Language.ContinueStatementAst] $statement){
        return $statement
    }
    
    [system.object] VisitConvertExpression([System.Management.Automation.Language.ConvertExpressionAst] $statement){
        $this.VisitElement($statement.Type)
        $this.VisitElement($statement.Child)
        return $statement
    }
    
    [system.object] VisitDataStatement([System.Management.Automation.Language.DataStatementAst] $statement){
        return $statement
    }
    
    [system.object] VisitDoUntilStatement([System.Management.Automation.Language.DoUntilStatementAst] $statement){
        $this.NewCode.Append("Do").Append("{")
        $this.VisitElement($statement.Body)
        $this.NewCode.Append("}").Append("Until").Append("(")
        $this.VisitElement($statement.Condition)
        $this.NewCode.Append(")")
        return $statement
    }
    
    [system.object] VisitDoWhileStatement([System.Management.Automation.Language.DoWhileStatementAst] $statement){
        $this.NewCode.Append("Do").Append("{")
        $this.VisitElement($statement.Body)
        $this.NewCode.Append("}").Append("While").Append("(")
        $this.VisitElement($statement.Condition)
        $this.NewCode.Append(")")
        return $statement
    }

    [system.object] VisitDynamicKeywordStatement([System.Management.Automation.Language.DynamicKeywordStatementAst] $statement){
        return $statement
    }
    
    [system.object] VisitErrorExpression([System.Management.Automation.Language.ErrorExpressionAst] $statement){
        return $statement
    }
    
    [system.object] VisitErrorStatement([System.Management.Automation.Language.ErrorStatementAst] $statement){
        return $statement
    }
    
    [system.object] VisitExitStatement([System.Management.Automation.Language.ExitStatementAst] $statement){
        return $statement
    }
    
    [system.object] VisitExpandableStringExpression([System.Management.Automation.Language.ExpandableStringExpressionAst] $statement){
        $StringConstantType = $statement.StringConstantType
        $QuoteTypeStart = ""
        $QuoteTypeEnd = ""
        $NewValue = $statement.Value
        If($StringConstantType -eq [System.Management.Automation.Language.StringConstantType]::SingleQuoted){
            $QuoteTypeStart = $QuoteTypeEnd = "'"
            #$NewValue = [StringObfuscator]::Obfuscate($statement.Value)
        }ElseIf($StringConstantType -eq [System.Management.Automation.Language.StringConstantType]::SingleQuotedHereString){
            $QuoteTypeStart = "@'"
            $QuoteTypeEnd = "'@"
        }ElseIf($StringConstantType -eq [System.Management.Automation.Language.StringConstantType]::DoubleQuoted){
            $QuoteTypeStart = $QuoteTypeEnd = "`""
            #$NewValue = [StringObfuscator]::Obfuscate($statement.Value)
        }ElseIf($StringConstantType -eq [System.Management.Automation.Language.StringConstantType]::DoubleQuotedHereString){
            $QuoteTypeStart = "@`""
            $QuoteTypeEnd = "`"@"
        }ElseIf($StringConstantType -eq [System.Management.Automation.Language.StringConstantType]::BareWord){
            $QuoteTypeStart = $QuoteTypeEnd = ""
            $NewValue = [StringObfuscator]::CapitalisationObfuscation($statement.Value)
        }
        #$QuoteTypeStart = $QuoteTypeEnd = ""
        $this.NewCode.Append($QuoteTypeStart).NoSpace().Append($NewValue).NoSpace().Append($QuoteTypeEnd)
        return $statement
    }
    
    [system.object] VisitFileRedirection([System.Management.Automation.Language.FileRedirectionAst] $statement){
        return $statement
    }
    
    [system.object] VisitForEachStatement([System.Management.Automation.Language.ForEachStatementAst] $statement){
        $this.NewCode.Append("ForEach").Append("(")
        $this.VisitElement($statement.Variable)
        $this.NewCode.Append("in")
        $this.VisitElement($statement.Condition)
        $this.NewCode.Append(")").Append("{")
        $this.VisitElement($statement.Body)
        $this.NewCode.Append("}")
        return $statement
    }
    
    [system.object] VisitForStatement([System.Management.Automation.Language.ForStatementAst] $statement){
        $this.NewCode.Append("For").Append("(")
        $this.VisitElement($statement.Initializer)
        $this.NewCode.Append(";")
        $this.VisitElement($statement.Condition)
        $this.NewCode.Append(";")
        $this.VisitElement($statement.Iterator)
        $this.NewCode.Append(")").Append("{")
        $this.VisitElement($statement.Body)
        $this.NewCode.Append("}")
        return $statement
    }
    
    [system.object] VisitFunctionDefinition([System.Management.Automation.Language.FunctionDefinitionAst] $statement){
        $this.NewCode.Append("function").Append($statement.Name).Append("{").NewLine()
        $this.VisitElement($statement.Body)
        $this.NewCode.Append("}")
        return $statement
    }

    
    [system.object] VisitFunctionMember([System.Management.Automation.Language.FunctionMemberAst] $statement){
        $this.VisitElement($statement.ReturnType)
        if($statement.IsPrivate){
            $this.NewCode.Append("Private")
        }
        if($statement.IsStatic){
            $this.NewCode.Append("Static")
        }
        $this.NewCode.Append($statement.Name).Append("(")
        $this.VisitElements($statement.Parameters, ",")
        $this.NewCode.Append(")").Append("{").NewLine()
        $this.VisitElement($statement.Body)
        $this.NewCode.Append("}").NewLine()
        return $statement
    }
    
    [system.object] VisitHashtable([System.Management.Automation.Language.HashtableAst] $statement){
        return $statement
    }
    
    [system.object] VisitIfStatement([System.Management.Automation.Language.IfStatementAst] $statement){
        For($i = 0; $i -lt $statement.Clauses.Item1.Length; $i++){
            If($i -ne 0){
                $this.NewCode.Append("Else").NoSpace()
            }
            $this.NewCode.Append("If").Append("(")
            $this.VisitElement($statement.Clauses.Item1[$i])
            $this.NewCode.Append(")").Append("{")
            $this.VisitElement($statement.Clauses.Item2[$i])
            $this.NewCode.Append("}")
        }
        If($statement.ElseClause){
            $this.NewCode.Append("Else").Append("{")
            $this.VisitElement($statement.ElseClause)
            $this.NewCode.Append("}")
        }
        return $statement
    }
    
    [system.object] VisitIndexExpression([System.Management.Automation.Language.IndexExpressionAst] $statement){
        return $statement
    }
    
    [system.object] VisitInvokeMemberExpression([System.Management.Automation.Language.InvokeMemberExpressionAst] $statement){
        $this.VisitElement($statement.Expression)
        $this.NewCode.NoSpace().Append(".").NoSpace()
        $this.VisitElement($statement.Member)
        $this.NewCode.NoSpace().Append("(")
        $this.VisitElements($statement.Arguments, ",")
        $this.NewCode.Append(")")
        return $statement
    }
    
    [system.object] VisitMemberExpression([System.Management.Automation.Language.MemberExpressionAst] $statement){
        $this.VisitElement($statement.Expression)
        $this.NewCode.NoSpace()
        If($statement.Static){
            $this.NewCode.Append("::")
        }Else{
            $this.NewCode.Append(".")
        }
        $this.NewCode.NoSpace()
        $this.VisitElement($statement.Member)
        return $statement
    }
    
    [system.object] VisitMergingRedirection([System.Management.Automation.Language.MergingRedirectionAst] $statement){
        return $statement
    }
    
    [system.object] VisitNamedAttributeArgument([System.Management.Automation.Language.NamedAttributeArgumentAst] $statement){
        $this.NewCode.Append($statement.ArgumentName).Append("=")
        $this.VisitElement($statement.Argument)
        return $statement
    }
    
    [system.object] VisitNamedBlock([System.Management.Automation.Language.NamedBlockAst] $statement){
        $this.VisitElements($statement.Traps)
        $this.VisitStatements($statement.Statements)
        return $statement
    }
    
    [system.object] VisitParamBlock([System.Management.Automation.Language.ParamBlockAst] $statement){
        $this.VisitElements($statement.Attributes, ",")
        $this.NewCode.Append("Param").Append("(")
        $this.VisitElements($statement.Parameters, ",")
        $this.NewCode.Append(")")
        return $statement
    }
    
    [system.object] VisitParameter([System.Management.Automation.Language.ParameterAst] $statement){
        $this.VisitElements($statement.Attributes)
        $this.NewCode.Append($statement.Name)
        if($statement.DefaultValue){
            $this.NewCode.Append("=")
            $this.VisitElement($statement.DefaultValue)
        }
        return $statement
    }
    
    [system.object] VisitParenExpression([System.Management.Automation.Language.ParenExpressionAst] $statement){
        $this.NewCode.Append("(")
        $this.VisitElement($statement.Pipeline)
        $this.NewCode.Append(")")
        return $statement
    }
    
    [system.object] VisitPipeline([System.Management.Automation.Language.PipelineAst] $statement){
        $this.VisitElements($statement.PipelineElements)
        return $statement
    }
    
    [system.object] VisitPropertyMember([System.Management.Automation.Language.PropertyMemberAst] $statement){
        $this.VisitElements($statement.PropertyType)
        If($statement.IsPrivate){
            $this.NewCode.Append("Private")
        }
        If($statement.IsStatic){
            $this.NewCode.Append("Static")
        }
        $this.NewCode.Append("$").NoSpace().Append($statement.Name)
        If($statement.InitialValue){
            $this.NewCode.Append("=")
            $this.VisitElement($statement.InitialValue)
        }
        return $statement
    }

    [system.object] VisitReturnStatement([System.Management.Automation.Language.ReturnStatementAst] $statement){
        $this.NewCode.Append("Return")
        $this.VisitElement($statement.Pipeline)
        return $statement
    }
    
    [system.object] VisitScriptBlock([System.Management.Automation.Language.ScriptBlockAst] $statement){
        $this.VisitElement($statement.BeginBlock)
        $this.NewCode.NewLine()
        $this.VisitElement($statement.ParamBlock)
        $this.NewCode.NewLine()
        $this.VisitElement($statement.EndBlock)
        $this.NewCode.NewLine()
        $this.VisitElement($statement.ProcessBlock)
        $this.NewCode.NewLine()
        return $statement
    }
    
    [system.object] VisitScriptBlockExpression([System.Management.Automation.Language.ScriptBlockExpressionAst] $statement){
        $this.NewCode.Append("{")
        $this.VisitElement($statement.ScriptBlock)
        $this.NewCode.Append("}")
        return $statement
    }
    
    [system.object] VisitStatementBlock([System.Management.Automation.Language.StatementBlockAst] $statement){
        $this.VisitStatements($statement.Statements)
        return $statement
    }
    
    [system.object] VisitStringConstantExpression([System.Management.Automation.Language.StringConstantExpressionAst] $statement){
        $StringConstantType = $statement.StringConstantType
        $QuoteTypeStart = ""
        $QuoteTypeEnd = ""
        $NewValue = $statement.Value
        If($StringConstantType -eq [System.Management.Automation.Language.StringConstantType]::SingleQuoted){
            $QuoteTypeStart = $QuoteTypeEnd = "'"
            #$NewValue = [StringObfuscator]::Obfuscate($statement.Value)
        }ElseIf($StringConstantType -eq [System.Management.Automation.Language.StringConstantType]::SingleQuotedHereString){
            $QuoteTypeStart = "@'"
            $QuoteTypeEnd = "'@"
        }ElseIf($StringConstantType -eq [System.Management.Automation.Language.StringConstantType]::DoubleQuoted){
            $QuoteTypeStart = $QuoteTypeEnd = "`""
            #$NewValue = [StringObfuscator]::Obfuscate($statement.Value)
        }ElseIf($StringConstantType -eq [System.Management.Automation.Language.StringConstantType]::DoubleQuotedHereString){
            $QuoteTypeStart = "@`""
            $QuoteTypeEnd = "`"@"
        }ElseIf($StringConstantType -eq [System.Management.Automation.Language.StringConstantType]::BareWord){
            $QuoteTypeStart = $QuoteTypeEnd = ""
            $NewValue = [StringObfuscator]::CapitalisationObfuscation($statement.Value)
        }
        #$QuoteTypeStart = $QuoteTypeEnd = ""
        $this.NewCode.Append($QuoteTypeStart).NoSpace().Append($NewValue).NoSpace().Append($QuoteTypeEnd)
        return $statement
    }
    
    [system.object] VisitSubExpression([System.Management.Automation.Language.SubExpressionAst] $statement){
        return $statement
    }
    
    [system.object] VisitSwitchStatement([System.Management.Automation.Language.SwitchStatementAst] $statement){
        return $statement
    }
    
    [system.object] VisitThrowStatement([System.Management.Automation.Language.ThrowStatementAst] $statement){
        return $statement
    }
    
    [system.object] VisitTrap([System.Management.Automation.Language.TrapStatementAst] $statement){
        return $statement
    }
    
    [system.object] VisitTryStatement([System.Management.Automation.Language.TryStatementAst] $statement){
        return $statement
    }
    
    [system.object] VisitTypeConstraint([System.Management.Automation.Language.TypeConstraintAst] $statement){
        $this.NewCode.Append("[").NoSpace().Append($statement.TypeName.FullName)
        if($statement.TypeName.IsArray){
            $this.NewCode.NoSpace().Append("[]")
        }
        $this.NewCode.NoSpace().Append("]")
        return $statement
    }

    [system.object] VisitTypeDefinition([System.Management.Automation.Language.TypeDefinitionAst] $statement){
        If($statement.isClass){
            $this.NewCode.Append("Class")
        }
        If($statement.isEnum){
            $this.NewCode.Append("Enum")
        }
        If($statement.isInterface){
            $this.NewCode.Append("Interface")
        }
        $this.NewCode.Append($statement.Name)
        $this.NewCode.Append("{").NewLine()
        $this.VisitStatements($statement.Members)
        $this.NewCode.Append("}").NewLine()
        return $statement
    }
    
    [system.object] VisitTypeExpression([System.Management.Automation.Language.TypeExpressionAst] $statement){
        $this.NewCode.Append("[").Append($statement.TypeName.Name).Append("]")
        return $statement
    }
    
    [system.object] VisitUnaryExpression([System.Management.Automation.Language.UnaryExpressionAst] $statement){
        $this.VisitElement($statement.Child)
        $this.NewCode.NoSpace().Append([Tokens]::Kind[$statement.TokenKind.ToString()])
        return $statement
    }
    
    [system.object] VisitUsingExpression([System.Management.Automation.Language.UsingExpressionAst] $statement){
        return $statement
    }

    [system.object] VisitUsingStatement([System.Management.Automation.Language.UsingStatementAst] $statement){
        return $statement
    }
    
    [system.object] VisitVariableExpression([System.Management.Automation.Language.VariableExpressionAst] $statement){
        If($statement.Splatted){
            $this.NewCode.Append("@").NoSpace()
        }Else{
            $this.NewCode.Append("$").NoSpace()
        }
        $this.NewCode.Append($statement.VariablePath.UserPath)
        return $statement
    }
    
    [system.object] VisitWhileStatement([System.Management.Automation.Language.WhileStatementAst] $statement){
        $this.NewCode.Append("While").Append("(")
        $this.VisitElement($statement.Condition)
        $this.NewCode.Append(")").Append("{")        
        $this.VisitElement($statement.Body)
        $this.NewCode.Append("}")
        return $statement
    }
     
}
