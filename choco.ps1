Configuration Desktop {

    # Import the module that contains the File resource.
    Import-DscResource -ModuleName PsDesiredStateConfiguration
    Import-DscResource -ModuleName xPSDesiredStateConfiguration
    Import-DscResource -ModuleName cChoco
    Import-DscResource -ModuleName 'xHyper-V'

    # The Node statement specifies which targets to compile MOF files for, when
    # this configuration is executed.
    Node 'localhost' {
        $VhdPath = "C://"
        $VMName = "nix_os_vm"
        $diskNameOS = "$VMName-DiskOS.vhdx"
        $diskNameExtra1 = "$VMName-Disk1.vhdx"

        xRemoteFile DownloadFile
        {
            DestinationPath = "C://nix.iso"
            Uri             = "https://channels.nixos.org/nixos-23.11/latest-nixos-gnome-x86_64-linux.iso"
            UserAgent = [Microsoft.PowerShell.Commands.PSUserAgent]::InternetExplorer
            Headers = @{
                'Accept-Language' = 'en-US'
            }
        }

        xVHD DiskOS
        {
            Name             = $diskNameOS
            Path             = $VhdPath
            Generation       = 'vhdx'
            MaximumSizeBytes = 20GB
            Ensure           = 'Present'
        }

        xVHD Disk1
        {
            Name             = $diskNameExtra1
            Path             = $VhdPath
            Generation       = 'vhdx'
            MaximumSizeBytes = 20GB
            Ensure           = 'Present'
        }

        xVMHyperV NewVM
        {
            Ensure     = 'Present'
            Name       = "nix_os_vm"
            VhdPath    = Join-Path $VhdPath -ChildPath $diskNameOS
            Generation = 1
            DependsOn  = '[xVHD]DiskOS'
        }

        cChocoPackageInstallerSet installChocoPackages
        {
                Ensure = 'present'
                Name = @(
                    "7zip.install"
                    "adobereader"
                    "alacritty"
                    "bitwarden"
                    "discord"
                    "docker-desktop"
                    "firefox"
                    "gcloudsdk"
                    "gimp"
                    "git"
                    "github-desktop"
                    "libreoffice-fresh"
                    "miktex"
                    "nerd-fonts-3270"
                    "netlogo"
                    "nodejs"
                    "nordvpn"
                    "python"
                    "r"
                    "rust"
                    "steam"
                    "strawberryperl"
                    "terraform"
                    "vscode"
                )
        }

        File alacritty_toml
        {
            Ensure = "Present" # Ensure the directory is Present on the target node.
            Type = "File" # The default is File.
            Force = $true
            # TODO Change to relative path somehow
            SourcePath = "C:\Users\spike\Documents\windows_install_scripts\alacritty.toml"
            DestinationPath = "C:\Users\spike\AppData\Roaming\alacritty\alacritty.toml"
            checksum = 'modifiedDate'
            matchsource = $true
        }

    }
}