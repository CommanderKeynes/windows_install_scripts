
Install script
```powershell
# Download Chocco
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# TODO Modify to use actual repo
Invoke-WebRequest `
    -Uri "https://storage.googleapis.com/choco_repo_af322/andrew-desktop-setup.0.1.0.nupkg" `
    -OutFile ".\andrew-desktop-setup\"
$file_path=".\andrew-desktop-setup\"
choco source add -n andrews_repo -s $file_path

choco install --yes andrew-desktop-setup
```

build script
```powershell
choco pack metapackage.nuspec
# TODOD increment version
# TODO: deploy to GCP
```