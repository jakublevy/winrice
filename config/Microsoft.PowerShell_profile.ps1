. (Join-Path $PSScriptRoot 'secret.ps1')

# Chocolatey autocompletion
Import-Module “$env:ChocolateyInstall\helpers\chocolateyProfile.psm1” -Force

Set-Alias -Name ip -Value ipconfig
Set-Alias -Name ydl -Value yt-dlp
Set-Alias -Name youtube-dl -Value yt-dlp
function cup { choco upgrade -y @args}
function cun { choco uninstall -x -y @args }
function cfin { choco find @args }
function cfind { choco find @args }
function cin { choco install -y @args }
function clisti { choco list --local-only @args }
function clisti { choco list @args }
function cout { choco outdated @args }
function cinfo { choco info @args }
function cpin { choco pin @args }

function gc { git clone @args }
function gs { git status @args }
function ga { git add @args }
function gaa { git add -A @args }
function gcm { git commit -m @args }
function gca { git commit --amend @args}
function gpuom { git push -u origin master @args }
function gpfom { git push -f origin master @args }

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