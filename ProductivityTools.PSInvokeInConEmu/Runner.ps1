clear
cd $PSScriptRoot
Import-Module .\ProductivityTools.PSInvokeInConEmu.psm1 -Force

Invoke-PSCommandInConEmu {get-process} -ForegroundTab