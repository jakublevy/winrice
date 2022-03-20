param(
    [Parameter(Mandatory = $true)]
    [ValidateScript({if ($_){ Test-Path $_}})]
    [string[]]$InFile,

    [Parameter(Mandatory = $false)]
    [string[]]$OutFile,

    [Parameter(Mandatory = $false)]
    [ValidateScript({$Crf -ge 0 -and $Crf -le 51})]
    [int]$Crf = 28
)

function Encode([string]$if, [string]$of) { Start-Process -FilePath ffmpeg -ArgumentList '-i', `"$if`", '-vcodec', libx265, '-crf', $Crf, `"$of`" -NoNewWindow -Wait }

if($null -ne $OutFile -and $InFile.Length -ne $OutFile.Length) {
    Write-Error 'The number of files specified in $OutFile does not match the number of files in $InFile'
    exit
}

if($null -eq $OutFile) {
    for($i = 0; $i -lt $InFile.Length; ++$i) {
        $inFileObj = (Get-Item $InFile)[0]
        $tmpName = (Join-Path (Get-Location) ([System.IO.Path]::GetRandomFileName())) + $inFileObj.Extension
        Encode $inFileObj.FullName $tmpName
        Move-Item -Path $tmpName -Destination $inFileObj -Force
    }
}
else {
    for($i = 0; $i -lt $InFile.Length; ++$i) {
        $outFullName = [IO.Path]::GetFullPath($OutFile[$i])
        $inFileObj = (Get-Item $InFile)[0]
        Encode $inFileObj.FullName $outFullName
    }
}
