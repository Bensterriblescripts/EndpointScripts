#Uninstall Sophos VPN Old, may need to kill the VPN process prior
#Start-Process -Path "C:\Program Files (x86)\Sophos\Sophos SSL VPN Client\Uninstall.exe" /S /qn

#Install new client
Start-Process -Path "C:\VPNPackage\SophosConnect.msi" /QN -wait

#Transfer Config File
Copy-Item -Path "C:\VPNPackage\MITO-VPN.pro" -Destination "C:\Program Files (x86)\Sophos\Connect\Import\" -Recurse -Force