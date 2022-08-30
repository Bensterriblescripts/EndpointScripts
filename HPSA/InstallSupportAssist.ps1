#Transfer contents of package into temp folder
New-Item -Path "C:\" -Name "HPSAInstall" -Itemtype "directory" -Force
Copy-Item -Path "HPSAInstall\*" -Destination "C:\HPSAInstall" -Recurse -Force
Set-Location -Path "C:\HPSAInstall\"

#HP Dependencies and exe
add-appxpackage -path "C:\HPSAInstall\HPSA9x\Dependencies\x64\netframework.appx"
add-appxpackage -path "C:\HPSAInstall\HPSA9x\Dependencies\x64\netruntime.appx"
Start-Process "C:\HPSAInstall\sp140482.exe" /s -wait

#Breathing room for HPSA then remove temp install folder
Remove-Item -Path "C:\HPSAInstall" -Recurse -Force