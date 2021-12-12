$ignore = @('.git', 'icons')

Get-ChildItem "$env:UserProfile\Repos\chocopkgs" | ? { -Not $ignore.Contains($_.Name) -And $_.Attributes -eq 'Directory' } | % -ThrottleLimit 12 -Parallel {
    Start-Process `
        -FilePath 'pwsh.exe' `
        -ArgumentList "$($_.FullName)\update.ps1" `
        -WorkingDirectory $_.FullName `
        -NoNewWindow
}