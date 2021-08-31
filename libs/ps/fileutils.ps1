function Wait-FileUnlock {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string] $FileName,

        [Parameter()]
        [int] $CheckEveryMs = 100,

        [Parameter()]
        [int] $TimeoutMs = -1
    )

    $success = $false
    $sw = [System.Diagnostics.Stopwatch]::StartNew()
    while($sw.ElapsedMilliseconds -lt $TimeoutMs -or $TimeoutMs -eq -1) {
        try { 
            [IO.File]::OpenWrite($FileName).close(); 
            $success = $true
            break
        }
        catch {
            Start-Sleep -Milliseconds $CheckEveryMs
        }
    }
    $success
}