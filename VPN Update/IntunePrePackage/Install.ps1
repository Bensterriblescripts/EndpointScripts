#Transfer contents of package into temp folder
New-Item -Path "C:\" -Name "VPNPackage" -Itemtype "directory" -Force
Copy-Item -Path "VPNPackage\*" -Destination "C:\VPNPackage" -Recurse -Force
Set-Location -Path "C:\VPNPackage\"

#Uninstall Sophos VPN Old, may need to kill the VPN process prior, requires testing
$isinstalledOLD = Test-Path "C:\Program Files (x86)\Sophos\Sophos SSL VPN Client\Uninstall.exe"
if ($isinstalledOLD = 'true'){
Start-Process "C:\Program Files (x86)\Sophos\Sophos SSL VPN Client\Uninstall.exe" /S /qn -wait
}

#Install new client if not available
$isinstalledNEW = Test-Path "C:\Program Files (x86)\Sophos\Connect\Gui\scgui.exe"
if ($isinstalledNEW = 'false'){
Start-Process "C:\VPNPackage\SophosConnect.msi" /QN -wait
}

#Transfer Config File
Copy-Item -Path "C:\VPNPackage\MITO-VPN.pro" -Destination "C:\Program Files (x86)\Sophos\Connect\Import\" -Recurse -Force
#Start Sophos Gui
Start-Process "C:\Program Files (x86)\Sophos\Connect\Gui\scgui.exe" -wait