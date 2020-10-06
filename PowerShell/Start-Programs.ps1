<#
    .SYNOPSIS
        This script launches various processes
        
    .DESCRIPTION
        This script will:
        - Prompt for any necessary credentials
        - Launch the specified processes
        
    .EXAMPLE
        .\Start-Programs.ps1

    .NOTES
        Creator:        Gierael Ortega
        Version:        1.5.0.0
        Version Date:   2019-05-19
#>

<#
    CHANGELOG (VIEW GIT FOR CHANGES PRIOR TO LATEST VERSION)

    v1.5.0.0
        Added
            - Personal programs
        Changed
            - N/A
        Fixed
            - N/A
        Removed
            - Barrick-related content
#>

#-----------------------------------------------------[Declarations]---------------------------------------------------------

# ADD/REMOVE/CHANGE AS NEEDED
$programs        =  @()

$programs    += New-Object PSObject -Property @{
    Name      = "Brave Browser"
    File      = "C:\Program Files (x86)\BraveSoftware\Brave-Browser\Application\brave.exe"
}

$programs    += New-Object PSObject -Property @{
    Name      = "Microsoft OneNote"
    File      = "C:\Program Files (x86)\Microsoft Office\root\Office16\ONENOTE.EXE"
}

$programs    += New-Object PSObject -Property @{
    Name      = "Steam"
    File      = "C:\Program Files (x86)\Steam\Steam.exe"
}

$programs    += New-Object PSObject -Property @{
    Name      = "Steam"
    File      = "C:\Program Files (x86)\Steam\Steam.exe"
}

$programs    += New-Object PSObject -Property @{
    Name      = "Steam"
    File      = "C:\Program Files (x86)\Origin\Origin.exe"
}

# TODO: Add other programs
#        - Amazon Music
#        - Spotify (?)
#        - Twitch
#        - Mail
#        - Discord
#        - Slack
#        - BattleNet
#        - KeePass
#        - VMware Workstation
#        - SideSync


#-----------------------------------------------------[Execution]-----------------------------------------------------------

# TODO: Implement launch type logic
#       - "Game Mode"
#       - "Dev Mode"
#       - "Music Mode"
$count = 0
$total = $programs.count + 2
ForEach ($program in $programs)
{
    Write-Progress -Activity "Launching Programs ($count / $total)" -Status "Launching $($program.Name)" -PercentComplete (($count / $total) * 100)
    if ($program.Arguments) { Start-Process -FilePath $program.File -ArgumentList $program.Arguments }
    else { Start-Process -FilePath $program.File }
    $count++
}

$count++

# Launching using the Visual Studio code command to resolve exit bug
Write-Progress -Activity "Launching Programs ($count / $total)" -Status "Launching Microsoft Visual Studio Code" -PercentComplete (($count / $total) * 100)
code $notesLocation
$count++

exit

#---------------------------------------------------------------------------------------------------------------------------