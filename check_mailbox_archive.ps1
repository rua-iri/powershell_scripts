
param (
  [string] $userEmail
)

if (!$userEmail) {
    Write-Output "User's Email is a Required Argument"
    exit 1;
  }


while ($true) {
  echo "------";
  Get-Date -DisplayHint Time;
  Get-MailboxStatistics -Identity $userEmail -Archive | Select DisplayName,ItemCount,TotalItemSize,LastLogonTime;
  Get-MailboxStatistics -Identity $userEmail | Select DisplayName,ItemCount,TotalItemSize,LastLogonTime;
  Start-Sleep -Seconds 10;
}
