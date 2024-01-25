# shell to get monitor screen serial number
$Monitors = Get-WmiObject WmiMonitorID -Namespace root\wmi

ForEach ($Monitor in $Monitors)
	{
		$Manufacturer = ($Monitor.ManufacturerName -notmatch 0 | ForEach{[char]$_}) -join ""
		$Name = ($Monitor.UserFriendlyName -notmatch 0 | ForEach{[char]$_}) -join "" 
		$Serial = ($Monitor.SerialNumberID -notmatch 0 | ForEach{[char]$_}) -join ""
		"$Manufacturer,$Name,$Serial"
	}

# shell to get computer serial number
Get-WmiObject win32_bios | select Serialnumber

