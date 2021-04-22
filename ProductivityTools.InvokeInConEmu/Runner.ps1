clear
cd $PSScriptRoot
Import-Module .\ProductivityTools.InvokeInConEmu.psm1 -Force

#Invoke-PSCommandInConEmu {get-process} -ForegroundTab
Set-MasterConfigurationBaseConfigurationFile -BaseConfigurationFileName  d:\Tech\PSMasterConfiguration.xml
Set-MasterConfiguration -Key ConEmuPath -Value "c:\Program Files\ConEmu\ConEmu64.exe"
$x=get-MasterConfiguration -Key ConEmuPath -Object
Invoke-PSCommandInConEmu {get-process} 