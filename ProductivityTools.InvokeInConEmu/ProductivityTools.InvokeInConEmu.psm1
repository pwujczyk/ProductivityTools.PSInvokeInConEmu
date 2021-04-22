function GetConEmuPath()
{
	$conemupath=Get-MasterConfiguration -Key "ConEmuPath" -Object
	if ($conemupath -eq $null)
	{
		throw "ConEmuPath not setup please set it up using Set-MasterConfiguration -Key ConEmuPath -Value value"
	}
	return $conemupath.Value
	#return "c:\Program Files\ConEmu\ConEmu64.exe"
}

function InvokeConEmu{
	[cmdletbinding()]
	param ([string]$powershellSwitchCommand, [switch]$ForegroundTab)

	$path=GetConEmuPath

	if ($ForegroundTab.IsPresent)
	{
		& $path -single -run powershell.exe -noexit $powershellSwitchCommand 
	}
	else
	{
		& $path -single -run powershell.exe -noexit $powershellSwitchCommand -new_console:b
	}
}


function Invoke-PSScriptFileInConEmu {
	[cmdletbinding()]
	param ([String]$ScriptPath, [switch]$ForegroundTab)

	[string]$powershellCommand="invoke-expression -command $ScriptPath"
	InvokeConEmu $powershellCommand -ForegroundTab:$ForegroundTab
}

function Invoke-PSCommandInConEmu{
	[cmdletbinding()]
	param ([System.Management.Automation.ScriptBlock]$Command, [switch]$ForegroundTab)
		
	$powershellCommand="Invoke-Command -command {$Command}"
	InvokeConEmu $powershellCommand -ForegroundTab:$ForegroundTab
}