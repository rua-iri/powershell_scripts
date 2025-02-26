

$outputFile = "$HOME\Documents\microsoft_365_group_users.txt"
$listSeparator = " | "

$allGroups = Get-Group -ResultSize Unlimited


foreach ($group in $allGroups) {
    $groupName = $group.name

    $groupMembers = $group.Members

    $membersDisGroup = Get-DistributionGroupMember -Identity $group.Name -ErrorAction SilentlyContinue | Select-Object -ExpandProperty DisplayName
    $membersMicGroup = Get-UnifiedGroupLinks -Identity $group.Name -LinkType Members -ErrorAction SilentlyContinue | Select-Object -ExpandProperty DisplayName
    
    #  | Out-File -FilePath $outputFile -Append

    Write-Host $groupName

    "Group Name: $groupName"| Out-File -FilePath $outputFile -Append
    "Type: $($group.RecipientType)"| Out-File -FilePath $outputFile -Append
    "Owner: $($group.ManagedBy)"| Out-File -FilePath $outputFile -Append
    "Created At: $($group.WhenCreated)"| Out-File -FilePath $outputFile -Append
    "Email Address: $($group.WindowsEmailAddress)"| Out-File -FilePath $outputFile -Append

    $groupMembers = $groupMembers -join $listSeparator
    "Group Members: $($groupMembers)"| Out-File -FilePath $outputFile -Append

    $membersDisGroup = $membersDisGroup -join $listSeparator
    "Distribution List Members: $($membersDisGroup)"| Out-File -FilePath $outputFile -Append
    
    $membersMicGroup = $membersMicGroup -join $listSeparator
    "Microsoft Members: $($membersMicGroup)"| Out-File -FilePath $outputFile -Append


    # for nice formatting
    ""| Out-File -FilePath $outputFile -Append
    ""| Out-File -FilePath $outputFile -Append
    "----------------------------"| Out-File -FilePath $outputFile -Append
    ""| Out-File -FilePath $outputFile -Append


}


