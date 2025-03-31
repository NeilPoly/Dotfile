# Wake up oh-my-posh prompt (no use)
# oh-my-posh init pwsh --config 'C:\Users\guxq2\AppData\Local\Programs\oh-my-posh\themes\powerlevel10k_lean.omp.json' | Invoke-Expression

# Wake up starship prompt
Invoke-Expression (&starship init powershell)

# Use RSReadLine
# Import-Module PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# use ripgrep
Set-Alias grep rg

# alias which command
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}


# set directory background color(since 7.3 version)
$PSStyle.FileInfo.Directory = "`e[38;2;255;255;255m"

function set_proxy_variable {
  $proxy = 'http://127.0.0.1:10809'

    # temporary
    $env:HTTP_PROXY = $proxy
    $env:HTTPS_PROXY = $proxy

    # forever
    # [System.Environment]::SetEnvironmentVariable("HTTP_PROXY", $proxy, "User")
    # [System.Environment]::SetEnvironmentVariable("HTTPS_PROXY", $proxy, "User")
    
    Write-Host "`n   OPEN powershell proxy channel!`n"
}

function unset_proxy_variable {
    # temporary
    Remove-Item env:HTTP_PROXY
    Remove-Item env:HTTPS_PROXY

    # forever
    # [Environment]::SetEnvironmentVariable('http_proxy', $null, 'User')
    # [Environment]::SetEnvironmentVariable('https_proxy', $null, 'User')

    Write-Host "`n   CLOSE powershell proxy channel!`n"
}

Set-Alias proxy set_proxy_variable
Set-Alias unproxy unset_proxy_variable

Set-Alias open explorer.exe

proxy

