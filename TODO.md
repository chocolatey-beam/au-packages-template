# TODO - AU Packages Template Updates

## Wiki Updates

**Location**: `/home/lrbakken/development/chocolatey-beam/au-packages-template.wiki`

**Tasks**:
1. Update all references from `majkinetor/au` to `chocolatey-community/chocolatey-au`
2. Update module name from `AU` to `Chocolatey-AU`
3. Update installation instructions: `Install-Module Chocolatey-AU`
4. Add PowerShell 7 compatibility notes
5. Document `$PSNativeCommandArgumentPassing = 'Legacy'` workaround
6. Update any code examples with correct module name
7. Add GitHub Actions workflow documentation alongside AppVeyor

## Code Updates

- [x] Phase 1: Assessment complete
- [x] Phase 2: Core updates (module names, PSScriptAnalyzer fixes, formatting)
- [x] Phase 3: Add GitHub Actions workflows
- [x] Phase 4: Documentation updates (POWERSHELL7.md, README)

## Remaining Tasks

### High Priority

1. **Create Invoke-Validation.ps1** - PSScriptAnalyzer validation script for template
2. **Update .gitignore** - Ensure all generated files are excluded
3. **Complete GitHub Actions setup docs** - Explain secrets, gist setup in README
4. **Test sample packages** - Verify copyq, less, librecad, prey still work

### Medium Priority

5. **Wiki updates** - Update all content in `au-packages-template.wiki` repository
6. **Test AppVeyor config** - Verify it still works with renamed scripts
7. **Add examples** - Show complete setup workflow for new users

### Low Priority

8. **Update screenshots** - If wiki has any outdated images
9. **Review sample packages** - Consider if better examples exist
