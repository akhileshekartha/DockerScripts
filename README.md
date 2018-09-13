Auto-load these scripts when using Powershell, by editing your Microsoft Powershell profile.
You can find this profile under "C:\Users\<your username>\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
Open the file and add the following line (replace the text between brackets with the path where you stored these files)
  '<source path>\DockerScripts\*.psm1' | gci | Import-Module 
