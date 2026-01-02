# PowerShell 7 Compatibility

## Overview

This template has been updated to work with both PowerShell 5.1 and PowerShell 7+. If you're using PowerShell 7, you need to be aware of a breaking change introduced in PowerShell 7.3.0 that affects how empty strings are passed to external commands.

## The Breaking Change

PowerShell 7.3.0+ changed how empty strings are passed to external commands:

**PowerShell 5.1 behavior:**
```powershell
$empty = ''
choco.exe push package.nupkg $empty
# Result: choco receives 2 arguments (empty string filtered out)
# Command: choco.exe push package.nupkg
```

**PowerShell 7+ behavior:**
```powershell
$empty = ''
choco.exe push package.nupkg $empty
# Result: choco receives 3 arguments (empty string passed as "")
# Command: choco.exe push package.nupkg ""
```

## Impact on AU Module

The Chocolatey-AU module has code that sets optional parameters to empty strings:

```powershell
$force_push = if ($Env:au_ForcePush) { '--force' } else { '' }
choco push $package --api-key $key --source $url $force_push
```

In PowerShell 7, the empty string gets passed as `""`, which `choco` interprets as a filename argument, causing "file not found" errors.

## Solution

This template includes a workaround in `Update-Packages.ps1`:

```powershell
# PowerShell 7 compatibility: Use legacy argument passing to avoid empty string bug
if ($PSVersionTable.PSVersion.Major -ge 7) {
    $PSNativeCommandArgumentPassing = 'Legacy'
}
```

This restores PowerShell 5.1 behavior where empty strings are filtered out.

## When You Don't Need This

- **PowerShell 5.1**: The workaround is harmless but unnecessary
- **AppVeyor CI**: Uses PowerShell 5.1 by default, no workaround needed
- **After AU module fix**: Once [PR #85](https://github.com/chocolatey-community/chocolatey-au/pull/85) is merged, the workaround can be removed

## Alternative Solutions

If you don't want to use the `$PSNativeCommandArgumentPassing` workaround:

1. **Use PowerShell 5.1** instead of PowerShell 7
2. **Set `au_ForcePush` environment variable** to any non-empty value (enables force-push mode)
3. **Wait for AU module fix** to be merged upstream

## Testing

To verify the workaround works, test with PowerShell 7:

```powershell
# Should complete without "file not found" errors
$env:au_Push = 'false'
.\Update-Packages.ps1 -ForcedPackages 'your-package'
```

## References

- [PowerShell 7.3 Breaking Change Documentation](https://learn.microsoft.com/en-us/powershell/scripting/whats-new/what-s-new-in-powershell-73#psnativecommandargumentpassing)
- [Detailed explanation and test cases](https://gist.github.com/lukebakken/e7f9ba1fe1c71a46222ddac4b26f9d06)
- [AU Module PR #85](https://github.com/chocolatey-community/chocolatey-au/pull/85) - Fix for the empty string bug

## Summary

The PowerShell 7 compatibility workaround is included by default in this template. It's harmless in PowerShell 5.1 and necessary in PowerShell 7 until the AU module is fixed upstream.
