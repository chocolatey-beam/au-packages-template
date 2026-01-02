@{
    ExcludeRules = @(
        'PSAvoidGlobalVars'                             # Required by AU framework
        'PSAvoidUsingInvokeExpression'                  # Used in cinst-gh.ps1
        'PSUseApprovedVerbs'                            # cinst-gh uses unapproved verb
        'PSUseShouldProcessForStateChangingFunctions'   # Helper functions don't need ShouldProcess
        'PSUseDeclaredVarsMoreThanAssignments'          # $PSNativeCommandArgumentPassing is used by PowerShell runtime
    )
}
