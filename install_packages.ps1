
#Requires -RunAsAdministrator

$packages = @(
    "Git.Git",
    "GitHub.GitHubDesktop",
    "Microsoft.VisualStudioCode",
    "Bitwarden.Bitwarden",
    "Mozilla.Firefox",
    "Valve.Steam",
    "Adobe.Acrobat.Reader.64-bit",
    "Python.Python.3.12",
    "RProject.R",
    "Hashicorp.Terraform",
    "TheDocumentFoundation.LibreOffice",
    "MiKTeX.MiKTeX",
    "CCL.NetLogo",
    "vim.vim",
    "GNU.Emacs",
    "Docker.DockerDesktop",
    "GoLang.Go.1.18",
    "Rustlang.Rustup",
    "GIMP.GIMP",
    "OpenJS.NodeJS",
    "Discord.Discord", 
    "OpenVPNTechnologies.OpenVPN"
    "Google.CloudSDK")

foreach ($package in $packages){
    winget install -e --id $package 
}
