#Transfer contents of package into temp folder
New-Item -Path "C:\" -Name "NitroPDF" -Itemtype "directory" -Force
Copy-Item -Path "NitroPDF\*" -Destination "C:\NitroPDF" -Recurse -Force
Set-Location -Path "C:\NitroPDF\"

#Uninstall old client if not available
msiexec /i "C:\Temp\nitro_pro13_x64.msi" /qb NPSERIAL=edf173cb-9625-4823-877f-2270e8e3cb6a
