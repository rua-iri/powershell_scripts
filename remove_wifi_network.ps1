
param (
    [string] $networkName
)


$wifiNetwork=(netsh.exe wlan show profiles) -match $networkName

$wifiNetwork = $wifiNetwork.split(":")[1].trim()

netsh wlan delete profile $wifiNetwork


