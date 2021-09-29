# This script compiles manga-py from the source

# These dependencies need to be installed prior to running this script
# python 3.9, virtualenv==20.7.2
#
# choco install python --version 3.9
# pip install "virtualenv==20.7.2"

$dir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$version = "1.32.0"
$mangaPyDir = "$dir\manga-py-$version"

Invoke-WebRequest -UseBasicParsing -Uri "https://github.com/manga-py/manga-py/archive/refs/tags/$version.zip" -OutFile "$version.zip"
Expand-Archive "$version.zip" -DestinationPath $dir
virtualenv `"$mangaPyDir\venv`"
& "$mangaPyDir\venv\Scripts\activate.ps1"
pip install -r `"$mangaPyDir\requirements.txt`"
pip install "pyinstaller==4.5.1"
pyinstaller -F `"$mangaPyDir\manga.py`" --specpath `"$mangaPyDir\spec`" --distpath `"$mangaPyDir\dist`" --workpath `"$mangaPyDir\build`"
deactivate

Move-Item `
    -Path "$mangaPyDir\dist\manga.exe" `
    -Destination "$dir\manga-py.exe" `
    -Force

Remove-Item "$version.zip" `
    -Force `
    -ErrorAction SilentlyContinue

Remove-Item "$mangaPyDir" `
    -Recurse -Force `
    -ErrorAction SilentlyContinue

# Compare now the checksum of manga-py.exe file with the one given in VERIFICATION.txt