
Install packages
```powershell
choco install --yes .\packages.config
```

add source repo
```powershell
$file_path="C:\Users\spike\OneDrive\Documents\repos\windows_install_scripts\choco\andrew-desktop-setup\"
choco source add -n andrews_repo -s $file_path
choco source list
```

install from source repo
```powershell
choco install --yes andrew-desktop-setup
```
