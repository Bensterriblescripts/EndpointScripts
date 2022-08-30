#Transfer contents of package into temp folder
New-Item -Path "C:\" -Name "IntuneDownloads\VPNUpgrade" -Itemtype "directory" -Force
Copy-Item -Path "VPNPackage\*" -Destination "C:\IntuneDownloads\VPNUpgrade" -Recurse -Force
Set-Location -Path "C:\IntuneDownloads\VPNUpgrade"

#Kill old VPN process first to ensure uninstall is successful
taskkill /im openvpn-gui.exe /f
taskkill /im openvpnserv.exe /f
#Uninstall Sophos VPN Old
$isinstalledOLD = Test-Path "C:\Program Files (x86)\Sophos\Sophos SSL VPN Client\Uninstall.exe"
if ($isinstalledOLD = 'true'){
Start-Process "C:\Program Files (x86)\Sophos\Sophos SSL VPN Client\Uninstall.exe" /S -wait
}

#Install new client if not available
$isinstalledNEW = Test-Path "C:\Program Files (x86)\Sophos\Connect\Gui\scgui.exe"
if ($isinstalledNEW = 'false'){
Start-Process "C:\IntuneDownloads\VPNUpgrade\SophosConnect.msi" /QN -wait
}

#Transfer Config File
Copy-Item -Path "C:\IntuneDownloads\VPNUpgrade\MITO-VPN.pro" -Destination "C:\Program Files (x86)\Sophos\Connect\Import\" -Recurse -Force

#Start Sophos Gui
Start-Sleep -s 5
Start-Process "C:\Program Files (x86)\Sophos\Connect\Gui\scgui.exe"