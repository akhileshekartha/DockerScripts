$hostname =
$gitFolder = 
$navImageNameTag = 
$licenseFile = 
$dbcred = get-credential
$dbname = 
$dbcontainername = 
$dbcontainerimage =
$password = 
$isolation = hyperv
$locale = 'nl-NL'

docker run -d --hostname=$dbcontainername --isolation $isolation --memory 3G --cpu-shares=512 --restart no -e locale=$locale -e ACCEPT_EULA=Y -e sa_password=$password -v C:/temp/:C:/temp --name $dbcontainername $dbimage
 
$other = "--volume $($gitFolder):C:\run\mvx\repo --env locale=$locale"

New-NavContainer -containerName $hostname -accept_eula -accept_outdated -assignPremiumPlan `
-auth NavUserPassword -Credential $dbcred -databaseCredential $dbcred -databaseName $dbname `
-databaseServer $dbcontainername -doNotExportObjectsToText -FileSharePort 21 -imageName $navImageNameTag `
-includeCSide -licenseFile $licenseFile -restart unless-stopped -shortcuts Desktop -updateHosts