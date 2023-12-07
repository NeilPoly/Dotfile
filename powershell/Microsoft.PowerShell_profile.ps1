# Wake up oh-my-posh
oh-my-posh init pwsh --config 'C:\Users\guxq2\AppData\Local\Programs\oh-my-posh\themes\remk.omp.json' | Invoke-Expression

# Use RSReadLine
# Import-Module PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource History

# use ripgrep
Set-Alias grep rg

# alias which command
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}


# set directory background color(since 7.3 version)
$PSStyle.FileInfo.Directory = "`e[38;2;255;255;255m"