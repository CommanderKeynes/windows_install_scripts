
# Code Snippets
```powershell
. .\choco.ps1
Desktop
Start-DscConfiguration -Path .\Desktop -Verbose -Wait
```

```powershell
Remove-DscConfigurationDocument -Stage Pending
```

# TODO
- Get functional nixos VM
- Get Add choco packages previously removed