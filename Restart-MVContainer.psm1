﻿function Restart-MVContainer {
Param(
  [Parameter(Mandatory=$true)]
  [string]$navContainerName)

$envContent = docker inspect --format='{{ .Config.Env}}' $navContainerName
$dbsFormat = '(?<=databaseServer=).*?(?=\s)'
$dbServer = [regex]::Match($envContent,$dbsFormat)

docker restart $dbServer
Write-Host "Update hosts file with database server IP"
$file = "$env:windir\System32\drivers\etc\hosts"
$dbcontainerip = docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $dbServer
$data = foreach($line in Get-Content $file){
  if($line -match $dbServer)
  { }
  else
  {
    $line
  }
}
"$dbcontainerip $dbcontainername" | Add-Content -PassThru $data
$data | Set-Content $file -Force

Restart-NavContainer -containerName $navContainerName -Verbose

}
Export-ModuleMember Restart-MVContainer