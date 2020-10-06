<#
    .SYNOPSIS
        This script scrapes AnyRun's Malware Trends pages for campaigns and IOCs
        
    .DESCRIPTION
        This script will:
        - Retrieve a list of Top X (Default: 25) Malware Campaigns
        - Iterate through each trend/campaign and retrieve:
            - A description of the campaign
            - IOCs:
                - IP Addresses
                - Hashes
                - Domains
        - Store this data into the appropriate sub-directories
        
    .EXAMPLE
        .\Start-Programs.ps1

    .NOTES
        Creator:        Gierael Ortega
        Version:        0.1.0.1
        Version Date:   2020-10-03
#>

<#
    CHANGELOG (VIEW GIT FOR CHANGES PRIOR TO LATEST VERSION)

    v0.1.0.1
        Added
            - N/A
        Changed
            - N/A
        Fixed
            - Correct script's description
        Removed
            - N/A
#>

# Script to scrape AnyRun's Trend Tracker Page
$StorageDir = "/AnyRunData/"
$AnyRunLink = "https://any.run"
$TopCount   = 25
# TODO: Add additional grouping for refined output and data manipulation
#$TopData    = @{}

# Retrieve Top X Trending Malware Campaigns
$TrendsRequest = Invoke-WebRequest -Method "GET" -Uri "$AnyRunLink/malware-trends/"
$TopTrends   = ($TrendsRequest.links.href | Where-Object {$_ -match "/malware-trends/"})[0..$TopCount]

# Iterate through each trend and retrieve the campaign's description and IOCs (IP, Hash, Domain)
foreach ($Trend in $TopTrends)
{
    # ASSUMPTION: Naming standard from href is '/malware-trends/<NAME>' to allow for retrieval by index number
    $Name    = $Trend.Substring(16)
    $URI     = $AnyRunLink + $Trend
    $Request = Invoke-WebRequest -Method "GET" -Uri $URI
    $HTML    = New-Object -Com "HTMLFile"
    $HTML.IHTMLDocument2_write($Request.content)
    # TODO: Clean up description data to exclude tags from image descriptions
    $Description = $HTML.all.tags("p") | ForEach-Object InnerText
    # ASSUMPTION: AnyRun maintains the same naming scheme and structure for the IOC webpage portion
    $IPData      = $HTML.getElementById('ipData').innerText
    $HashData    = $HTML.getElementById('hashData').innerText
    $DomainData  = $HTML.getElementById('domainData').innerText

    # TODO: Add additional functionality (Possibly csv organization, tables, etc.)
    #$TopData[$Name] = @{"Description" = $Description; "IP_Data" = $IPData; "Hash_Data" = $HashData; "Domain_Data" = $DomainData;}

    # Export Campaign's Description, IP, Hash, and Domain Data (Replaces existing data)
    # ASSUMPTION: Sub-folders (IPs, Hashes, etc. exist)
    $Description | Out-File -FilePath "$PSScriptRoot\$StorageDir\Descriptions\$Name-description.txt"
    $IpData      | Out-File -FilePath "$PSScriptRoot\$StorageDir\IPs\$Name-ips.txt"
    $HashData    | Out-File -FilePath "$PSScriptRoot\$StorageDir\Hashes\$Name-hashes.txt"
    $DomainData  | Out-File -FilePath "$PSScriptRoot\$StorageDir\Domains\$Name-domains.txt"

    # TODO: Automate this process to periodically run and retrieve the latest IOC datasets
}