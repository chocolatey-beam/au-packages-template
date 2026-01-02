@{
    # Include all default rules plus formatting
    IncludeDefaultRules = $true

    ExcludeRules = @(
        'PSAvoidGlobalVars'                             # Required by AU framework
        'PSAvoidUsingInvokeExpression'                  # Used in cinst-gh.ps1
        'PSUseApprovedVerbs'                            # cinst-gh uses unapproved verb
        'PSUseShouldProcessForStateChangingFunctions'   # Helper functions don't need ShouldProcess
        'PSUseDeclaredVarsMoreThanAssignments'          # $PSNativeCommandArgumentPassing is used by PowerShell runtime
    )

    # Formatting rules
    Rules = @{
        PSUseConsistentIndentation = @{
            Enable = $true
            IndentationSize = 4
            PipelineIndentation = 'IncreaseIndentationForFirstPipeline'
            Kind = 'space'
        }

        PSUseConsistentWhitespace = @{
            Enable = $true
            CheckInnerBrace = $true
            CheckOpenBrace = $true
            CheckOpenParen = $true
            CheckOperator = $true
            CheckPipe = $true
            CheckPipeForRedundantWhitespace = $true
            CheckSeparator = $true
            CheckParameter = $false
        }

        PSAlignAssignmentStatement = @{
            Enable = $false
            CheckHashtable = $false
        }

        PSPlaceOpenBrace = @{
            Enable = $true
            OnSameLine = $false
            NewLineAfter = $true
            IgnoreOneLineBlock = $true
        }

        PSPlaceCloseBrace = @{
            Enable = $true
            NoEmptyLineBefore = $false
            IgnoreOneLineBlock = $true
            NewLineAfter = $true
        }

        PSUseCorrectCasing = @{
            Enable = $true
        }

        PSAvoidUsingCmdletAliases = @{
            Allowlist = @()
        }
    }
}
