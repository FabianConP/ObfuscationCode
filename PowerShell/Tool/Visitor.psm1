class Visitor : System.Management.Automation.Language.ICustomAstVisitor
{
    Visitor() {
    }

    [system.object] VisitArrayExpression([System.Management.Automation.Language.ArrayExpressionAst] $statement){
        return $statement
    }
    
    [system.object] VisitArrayLiteral([System.Management.Automation.Language.ArrayLiteralAst] $statement){
        return $statement
    }
    
    [system.object] VisitAssignmentStatement([System.Management.Automation.Language.AssignmentStatementAst] $statement){
        return $statement
    }
    
    [system.object] VisitAttribute([System.Management.Automation.Language.AttributeAst] $statement){
        return $statement
    }
    
    [system.object] VisitAttributedExpression([System.Management.Automation.Language.AttributedExpressionAst] $statement){
        return $statement
    }
    
    [system.object] VisitBinaryExpression([System.Management.Automation.Language.BinaryExpressionAst] $statement){
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
        return $statement
    }
    
    [system.object] VisitCommandExpression([System.Management.Automation.Language.CommandExpressionAst] $statement){
        return $statement
    }
    
    [system.object] VisitCommandParameter([System.Management.Automation.Language.CommandParameterAst] $statement){
        return $statement
    }
    
    [system.object] VisitConstantExpression([System.Management.Automation.Language.ConstantExpressionAst] $statement){
        return $statement
    }
    
    [system.object] VisitContinueStatement([System.Management.Automation.Language.ContinueStatementAst] $statement){
        return $statement
    }
    
    [system.object] VisitConvertExpression([System.Management.Automation.Language.ConvertExpressionAst] $statement){
        return $statement
    }
    
    [system.object] VisitDataStatement([System.Management.Automation.Language.DataStatementAst] $statement){
        return $statement
    }
    
    [system.object] VisitDoUntilStatement([System.Management.Automation.Language.DoUntilStatementAst] $statement){
        return $statement
    }
    
    [system.object] VisitDoWhileStatement([System.Management.Automation.Language.DoWhileStatementAst] $statement){
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
        return $statement
    }
    
    [system.object] VisitFileRedirection([System.Management.Automation.Language.FileRedirectionAst] $statement){
        return $statement
    }
    
    [system.object] VisitForEachStatement([System.Management.Automation.Language.ForEachStatementAst] $statement){
        return $statement
    }
    
    [system.object] VisitForStatement([System.Management.Automation.Language.ForStatementAst] $statement){
        return $statement
    }
    
    [system.object] VisitFunctionDefinition([System.Management.Automation.Language.FunctionDefinitionAst] $statement){
        return $statement
    }
    
    [system.object] VisitHashtable([System.Management.Automation.Language.HashtableAst] $statement){
        return $statement
    }
    
    [system.object] VisitIfStatement([System.Management.Automation.Language.IfStatementAst] $statement){
        return $statement
    }
    
    [system.object] VisitIndexExpression([System.Management.Automation.Language.IndexExpressionAst] $statement){
        return $statement
    }
    
    [system.object] VisitInvokeMemberExpression([System.Management.Automation.Language.InvokeMemberExpressionAst] $statement){
        return $statement
    }
    
    [system.object] VisitMemberExpression([System.Management.Automation.Language.MemberExpressionAst] $statement){
        return $statement
    }
    
    [system.object] VisitMergingRedirection([System.Management.Automation.Language.MergingRedirectionAst] $statement){
        return $statement
    }
    
    [system.object] VisitNamedAttributeArgument([System.Management.Automation.Language.NamedAttributeArgumentAst] $statement){
        return $statement
    }
    
    [system.object] VisitNamedBlock([System.Management.Automation.Language.NamedBlockAst] $statement){
        return $statement
    }
    
    [system.object] VisitParamBlock([System.Management.Automation.Language.ParamBlockAst] $statement){
        return $statement
    }
    
    [system.object] VisitParameter([System.Management.Automation.Language.ParameterAst] $statement){
        return $statement
    }
    
    [system.object] VisitParenExpression([System.Management.Automation.Language.ParenExpressionAst] $statement){
        return $statement
    }
    
    [system.object] VisitPipeline([System.Management.Automation.Language.PipelineAst] $statement){
        return $statement
    }
    
    [system.object] VisitReturnStatement([System.Management.Automation.Language.ReturnStatementAst] $statement){
        return $statement
    }
    
    [system.object] VisitScriptBlock([System.Management.Automation.Language.ScriptBlockAst] $statement){
        return $statement
    }
    
    [system.object] VisitScriptBlockExpression([System.Management.Automation.Language.ScriptBlockExpressionAst] $statement){
        return $statement
    }
    
    [system.object] VisitStatementBlock([System.Management.Automation.Language.StatementBlockAst] $statement){
        return $statement
    }
    
    [system.object] VisitStringConstantExpression([System.Management.Automation.Language.StringConstantExpressionAst] $statement){
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
        return $statement
    }
    
    [system.object] VisitTypeExpression([System.Management.Automation.Language.TypeExpressionAst] $statement){
        return $statement
    }
    
    [system.object] VisitUnaryExpression([System.Management.Automation.Language.UnaryExpressionAst] $statement){
        return $statement
    }
    
    [system.object] VisitUsingExpression([System.Management.Automation.Language.UsingExpressionAst] $statement){
        return $statement
    }
    
    [system.object] VisitVariableExpression([System.Management.Automation.Language.VariableExpressionAst] $statement){
        return $statement
    }
    
    [system.object] VisitWhileStatement([System.Management.Automation.Language.WhileStatementAst] $statement){
        return $statement
    }
     
}
