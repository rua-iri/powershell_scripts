

param (
    [string] $DomainName,
    [int] $PortNumber
)

Test-NetConnection  -Port $PortNumber $DomainName


