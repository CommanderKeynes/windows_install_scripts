
```powershell
. .\choco.ps1
Desktop
Start-DscConfiguration -Path .\Desktop -Verbose -Wait
```

```powershell
Remove-DscConfigurationDocument -Stage Pending
```