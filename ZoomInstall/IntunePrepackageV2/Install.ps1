#Transfer contents of package into temp folder
New-Item -Path "C:\" -Name "Zoom" -Itemtype "directory" -Force
Copy-Item -Path "Zoom\*" -Destination "C:\Zoom" -Recurse -Force
Set-Location -Path "C:\Zoom\"

#Install Zoom with Silent Switch
Start-Process "C:\Zoom\ZoomInstallerFull.msi" /qn -wait