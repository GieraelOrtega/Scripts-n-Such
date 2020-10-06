#########################################
#                                       #
#   Gierael's Computer Stopper Script   #
#                                       #
#########################################
<#
  Wat?: This script shuts down your Window's
        machine with a fancy countdown...
  Why?: Cuz.
#>

$CountdownAlert = New-Object -ComObject Wscript.Shell
$CountdownAlert.Popup("This computer will shutdown in 5",1,"SHUTDOWN INCOMING. SAVE YO STUFF.",0x0)
$CountdownAlert.Popup("4",1,"SHUTDOWN INCOMING. SAVE YO STUFF.",0x0)
$CountdownAlert.Popup("3",1,"SHUTDOWN INCOMING. SAVE YO STUFF.",0x0)
$CountdownAlert.Popup("2",1,"SHUTDOWN INCOMING. SAVE YO STUFF.",0x0)
$CountdownAlert.Popup("1",1,"SHUTDOWN INCOMING. SAVE YO STUFF.",0x0)
$CountdownAlert.Popup("0",1,"SHUTDOWN INCOMING. SAVE YO STUFF.",0x0)
Stop-Computer