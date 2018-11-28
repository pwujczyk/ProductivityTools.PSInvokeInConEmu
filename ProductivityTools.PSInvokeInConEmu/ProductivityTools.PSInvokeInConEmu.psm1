function InvokeConEmu{
	[cmdletbinding()]
	param ([string]$powershellSwitchCommand, [switch]$ForegroundTab)

	if ($ForegroundTab.IsPresent)
	{
		ConEmu64.exe -single -run powershell.exe -noexit $powershellSwitchCommand 
	}
	else
	{
		ConEmu64.exe -single -run powershell.exe -noexit $powershellSwitchCommand -new_console:b
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