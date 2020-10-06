###################################
#                                 #
#   Gierael's Lunch Menu Script   #
#                                 #
###################################
<#
  Wat?: This dumb script downloads and opens
        the lunch menu from the cafeteria in
        the Microsoft (Cambridge) building.
  Why?: Cuz.
#>

# Prepare URI's and other variables
$FileName = 'Menu.pdf'
$Site     = 'https://eurestcafes.compass-usa.com'
$URI      = $Site + '/oxfordCafe/Pages/Home.aspx?menu=1'
$Menu     = ((Invoke-WebRequest -Uri $URI).links | ?{$_.href -like "*DiningMenu*"})[0].href
$MenuURI  = $Site + $Menu
$Prompt   = "Please close the PDF when finished. Would you like to delete `'$FileName`'? (Y/N)"

# Download the PDF
Invoke-WebRequest -Uri $MenuURI -OutFile $FileName

# Open the menu
Start-Process $FileName

# Cleanup the downloaded PDF (Assumes the PDF was already closed)
$PerformDelete = Read-Host -Prompt $Prompt
if ($PerformDelete -like 'Y') { Remove-item $FileName -Force }
