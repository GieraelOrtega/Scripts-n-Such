#################################
#                               #
#   Gierael's File Downloader   #
#                               #
#################################
<#
  Wat?: This WIP script aims to help ease the 
        process of retrieve various files via
        a web-request.
  Why?: Cuz.
#>

# Prepare Search URI
$URI       = "https://www.office.com/search/files?auth=2="
$Search    = Read-Host -Prompt "Search Term(s)"
$SearchURI = $URI + $Search.Replace(' ', '+')

# Launch Edge using the URI (Do this until TODO completed)
# TODO: Make this a web-request which utilizes the user's SSO token
Start-Process microsoft-edge: $SearchURI

# TODO: Retrieve the web-request search results
