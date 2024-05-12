
# Code Snippets
```powershell
rm -r .\Desktop
. .\choco.ps1
Desktop
Set-Item -Path WSMan:\localhost\MaxEnvelopeSizeKb -Value 153600
Start-DscConfiguration -Path .\Desktop -Verbose -Wait
```

```powershell
Remove-DscConfigurationDocument -Stage Pending
```

# TODO
- Get functional nixos VM
- Get Add choco packages previously removed