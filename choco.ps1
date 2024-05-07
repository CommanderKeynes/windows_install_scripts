Configuration Desktop {

    # Import the module that contains the File resource.
    Import-DscResource -ModuleName PsDesiredStateConfiguration
    Import-DscResource -ModuleName cChoco

    # The Node statement specifies which targets to compile MOF files for, when
    # this configuration is executed.
    Node 'localhost' {

        cChocoPackageInstallerSet installGit
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