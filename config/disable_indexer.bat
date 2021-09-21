@echo off

sc config WSearch start=disabled
dism /online /disable-feature /featurename:SearchEngine-Client-Package