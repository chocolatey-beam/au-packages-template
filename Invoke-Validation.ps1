#Requires -Version 7.0
#Requires -Modules PSScriptAnalyzer

<#
.SYNOPSIS
Validates PowerShell scripts in the AU packages repository.

.DESCRIPTION
Runs PSScriptAnalyzer on all PowerShell scripts to ensure they follow
best practices and maintain consistent formatting.
#>

$InformationPreference = 'Continue'
$ErrorActionPreference = 'Stop'

$repoRoot = $PSScriptRoot
$settingsPath = Join-Path -Path $repoRoot -ChildPath 'PSScriptAnalyzerSettings.psd1'

# Find all PowerShell scripts
$filesToCheck = Get-ChildItem -Path $repoRoot -Recurse -Include *.ps1, *.psm1 | Where-Object {
    $_.FullName -notmatch '\\(node_modules|\.git)\\'
}

Write-Information "Validating $($filesToCheck.Count) PowerShell files..."

$allPassed = $true

foreach ($file in $filesToCheck)
{
    Write-Information "Analyzing $($file.Name)..."
    $results = Invoke-ScriptAnalyzer -Path $file.FullName -Settings $settingsPath
    
    if ($results)
    {
        $allPassed = $false
        Write-Information "Issues found in $($file.Name):"
        $results | Format-Table -AutoSize
    }
}

if ($allPassed)
{
    Write-Information "All checks passed!"
    exit 0
}
else
{
    Write-Error "Some checks failed. See output above."
    exit 1
}
