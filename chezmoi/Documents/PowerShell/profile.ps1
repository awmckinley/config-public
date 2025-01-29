# set environment
$env:HOME = $HOME

# use aliae
aliae init pwsh | Invoke-Expression

# use carapace
$env:CARAPACE_BRIDGES = ''
Set-PSReadLineOption -Colors @{ "Selection" = "`e[7m" }
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
carapace _carapace | Out-String | Invoke-Expression

# use Starship
starship init powershell --print-full-init | Out-String | Invoke-Expression

# use Terminal-Icons
Import-Module -Name Terminal-Icons

# use vfox
vfox activate pwsh | Out-String | Invoke-Expression

# use zoxide
zoxide init powershell | Out-String | Invoke-Expression
