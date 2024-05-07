Configuration Desktop {

    # Import the module that contains the File resource.
    Import-DscResource -ModuleName PsDesiredStateConfiguration
    Import-DscResource -ModuleName cChoco
    Import-DscResource -ModuleName 'xHyper-V'

    # The Node statement specifies which targets to compile MOF files for, when
    # this configuration is executed.
    Node 'localhost' {
        $VhdPath = "C://"
        $VMName = "nix_os_vm"
        $diskNameOS = "$VMName-DiskOS.vhdx"
        $diskNameExtra1 = "$VMName-Disk1.vhdx"

        WindowsFeature Hyper-V {
            Ensure = 'Present'
            Name = "Hyper-V"
        }

        WindowsFeature HyperVPowerShell
        {
            Ensure = 'Present'
            Name   = 'Hyper-V-PowerShell'
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
                    "bitwarden"
                    "discord"
                    "docker-desktop"
                    "gimp"
                    "github-desktop"
                    "git"
                    "gcloudsdk"
                    "terraform"
                    "miktex"
                    "firefox"
                    "rust"
                    "r"
                    "steam"
                    "nodejs"
                    "netlogo"
                    "vscode"
                    "adobereader"
                    "python"
                    "strawberryperl"
                )
        }

    }
}