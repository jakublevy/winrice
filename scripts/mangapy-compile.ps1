# This script compiles manga-py from the source and creates a release archive.

# These dependencies need to be installed prior to running this script
# python 3.9, virtualenv

$currdir = Get-Location
$version = "1.32.0"
$mangaPyDir = "$currdir\manga-py-$version"

Invoke-WebRequest -UseBasicParsing -Uri "https://github.com/manga-py/manga-py/archive/refs/tags/$version.zip" -OutFile "$currdir\$version.zip"
Expand-Archive "$currdir\$version.zip" -DestinationPath $currdir
virtualenv `"$mangaPyDir\venv`"
& "$mangaPyDir\venv\Scripts\activate.ps1"
pip install -r `"$mangaPyDir\requirements.txt`"
pip install "pyinstaller==4.1"
pyinstaller -F `"$mangaPyDir\manga.py`" --specpath `"$mangaPyDir\spec`" --distpath `"$mangaPyDir\dist`" --workpath `"$mangaPyDir\build`"
deactivate

Move-Item `
    -Path "$mangaPyDir\dist\manga.exe" `
    -Destination "$currdir\manga-py.exe" `
    -Force

Remove-Item "$version.zip" `
    -Force `
    -ErrorAction SilentlyContinue

Move-Item `
    -Path "$mangaPyDir\LICENSE" `
    -Destination $currdir `
    -Force

Remove-Item "$mangaPyDir" `
    -Recurse -Force `
    -ErrorAction SilentlyContinue

Compress-Archive `
    -Path "$currdir\LICENSE", "$currdir\manga-py.exe" `
    -Destination "$currdir\mangapy-$version-win-x64.zip" `
    -CompressionLevel Optimal

Remove-Item `
    -Path "$currdir\manga-py.exe", "$currdir\LICENSE" `
    -Force `
    -ErrorAction SilentlyContinue
