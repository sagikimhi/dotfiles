$gitdir = "$HOME\GitRepositories"
$confdir = "$HOME\.config"
$mygitdir = "$gitdir\SagiKimhi"

$gitrc = "$HOME\.gitconfig"
$nvimrc = "$confdir\nvim"
$psrc = "$profile"

Set-Alias -Name "v" -Value "nvim"

Set-Alias -Name "py311" -Value "py -3.11"
Set-Alias -Name "py312" -Value "py -3.12"
Set-Alias -Name "python3" -Value "python"

function test_args()
{
    Write-Host "here's arg 0: $($args[0])"
    Write-Host "here's arg 1: $($args[1])"
}

function grep() 
{
    $cmd="$($args[0])"
    $pattern="$($args[1])"
    $expression="$cmd | Out-String | Select-String -AllMatches -Pattern '$pattern'"

    Write-Host "cmd=$cmd"
    Write-Host "pattern=$pattern"
    Write-Host "expression=$expression"

    Invoke-Expression $expression
}

function psrc() { Invoke-Expression "v '$psrc'" }
function gitrc() { Invoke-Expression "v '$gitrc'" }
function nvimrc() { Invoke-Expression "v '$nvimrc'" }
