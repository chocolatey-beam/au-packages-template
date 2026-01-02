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

## Code Updates (In Progress)

- [x] Phase 1: Assessment complete
- [ ] Phase 2: Core updates (module names, PSScriptAnalyzer fixes)
- [ ] Phase 3: Add GitHub Actions workflows
- [ ] Phase 4: Documentation updates

## Future Considerations

- Test all sample packages work with updated code
- Verify AppVeyor config still works
- Consider adding POWERSHELL7.md document
- Update any screenshots or examples in wiki
