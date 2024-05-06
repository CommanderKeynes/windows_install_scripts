packages_to_install = [
	"bitwarden", "discord", "docker-desktop", "gimp", "github-desktop", "git", 
	"gcloudsdk", "terraform", "miktex", "firefox", "rust", "r", "steam", 
	"nodejs", "netlogo", "vscode", "adobereader", "python", "strawberryperl"]
packages_to_install.each do |package_to_install|
	chocolatey_package "#{package_to_install}" do
		action :install
	end
end