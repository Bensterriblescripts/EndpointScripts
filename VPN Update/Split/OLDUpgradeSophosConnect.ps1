#Uninstall Sophos VPN Old, may need to kill the VPN process prior
#Start-Process -Path "C:\Program Files (x86)\Sophos\Sophos SSL VPN Client\Uninstall.exe" /S /qn

#Install Sophos VPN New
Invoke-WebRequest -Uri "https://mitonewzealand.sharepoint.com/:u:/s/ITTeam642-ITAdministrationandEvents/ESouPPy8jklLulsH1bOnwEYBgGf6EKnsUu8Bre6ZyoHtSw?e=pZzLNW" -UseDefaultCredentials -OutFile "C:\Users\bnanson\OneDrive - MITO New Zealand Incorporated\Desktop"


#Locate and store 'downloads' folder location
#Version 1 using registry to find downloads
#$downloadslocale = Get-ItemPropertyValue -Path "Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders\" -Name "{374DE290-123F-4565-9164-39C4925E467B}"
#Version 2 using .net to find downloads
$downloadslocale = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path

#Hold for bad internet peoples, then start install
Start-Sleep -s 10
Start-Process -FilePath "$downloadslocale\SophosConnect_2.2.75_IPsec_and_SSLVPN.msi" /QN -wait
