param(
    [Parameter(Mandatory = $true)]
    [ValidateScript({if ($_){  Test-Path $_}})]
    [string]$EvenPath,

    [Parameter(Mandatory = $true)]
    [ValidateScript({if ($_){  Test-Path $_}})]
    [string]$OddPath,

    [Parameter()]
    [string]$OutPath = "$(Get-Location | Select-Object -Expand Path)\Out"
)

if(-Not (Test-Path $OutPath)) {
    New-Item -ItemType Directory -Path $OutPath
}

$evenPictures = Get-ChildItem $EvenPath | Sort-Object Name
$oddPictures = Get-ChildItem $OddPath | Sort-Object Name

$min = [math]::Min($evenPictures.Count, $oddPictures.Count)

for($i = 0; $i -lt $min; $i++) {
    Copy-Item $evenPictures[$i].FullName -Destination "$OutPath\$($i * 2 + 1)$($evenPictures[$i].Extension)"
    Copy-Item $oddPictures[$i].FullName -Destination "$OutPath\$($i * 2 + 2)$($oddPictures[$i].Extension)"
}

if($evenPictures.Count -gt $min) {
    for($i = $min; $i -lt $evenPictures.Count; $i++) {
        Copy-Item $evenPictures[$i].FullName -Destination "$OutPath\$(($i * 2 + 1) - ($i - $min))$($evenPictures[$i].Extension)"
    }
}
elseif($oddPictures.Count -gt $min) {
    for($i = $min; $i -lt $oddPictures.Count; $i++) {
        Copy-Item $oddPictures[$i].FullName -Destination "$OutPath\$(($i * 2 + 1) - ($i - $min))$($oddPictures[$i].Extension)"
    }
}