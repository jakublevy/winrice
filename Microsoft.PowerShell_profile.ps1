. ("$env:userprofile\Documents\Powershell\secret.ps1")

function prompt {
    $path = (Get-Location | Select-Object -exp Path)
    $split = $path.Split('\')
    if($split.Count -gt 2) {
        "PS $($split[0])\...\$($split[$split.Count - 1])> "
    }
    else {
        "PS $($split -join '\')> "
    }
}

# Chocolatey autocompletion
Import-Module "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1" -Force

Set-Alias -Name ip -Value ipconfig
Set-Alias -Name ydl -Value yt-dlp
Set-Alias -Name youtube-dl -Value yt-dlp
function cup { choco upgrade -y @args}
function cun { choco uninstall -x -y @args }
function cfin { choco find @args }
function cfind { choco find @args }
function cin { choco install -y @args }
function cin-dry { choco install -n -y @args }
function clisti { choco list --local-only @args }
function clist { choco list @args }
function cout { choco outdated @args }
function cinfo { choco info @args }
function cpin { choco pin @args }

function gc { git clone @args }
function gs { git status @args }
function ga { git add @args }
function gaa { git add -A @args }
function gcm { git commit -m @args }
function gca { git commit --amend @args}
function gpl { git pull @args }
function gplo { git pull origin @args }

function gplom { git pull origin master @args }
function gpshom { git push -u origin master @args }
function gpsho { git push -u origin @args }
function gpshfo { git push -f origin @args }
function gpshfom { git push -f origin master @args }

function gcd { git clone 'git@github.com:jakublevy/dotfiles.git' @args }
function gcwr { git clone 'git@github.com:jakublevy/winrice.git' @args }
function gccpkgs { git clone 'git@github.com:jakublevy/chocopkgs.git' @args }
function gcschool { git clone 'git@github.com:jakublevy/mff-student.git' @args }

function cdh { Set-Location $env:userprofile @args }
function cdd { Set-Location "$env:userprofile\Desktop" @args }
function cda { Set-Location 'D:\jakub\Videos\Anime' @args }
function cdr { Set-Location "$env:userprofile\Repos" @args }
function cdc { Set-Location "$env:userprofile\Repos\chocopkgs" @args }
function cdwr { Set-Location $env:rice @args }


function streamlink { streamlink --player mpv @args }
function mpvq { quiet mpv --no-terminal @args }
function grep { grep --color=auto @args }
function sha256 { ddh sha256 @args }
function sha512 { ddh sha512 @args }

function cclean { cleanmgr /verylowdisk /autoclean /sagerun:5 ; powershell -Command "& $env:ChocolateyToolsLocation\BCURRAN3\choco-cleaner.ps1" @args }
# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
