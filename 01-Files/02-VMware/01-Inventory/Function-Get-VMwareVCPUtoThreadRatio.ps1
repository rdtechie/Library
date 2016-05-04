function Get-VMwareVCPUtoThreadRatio {
	[CmdletBinding()]
	param (
		[Parameter(Position = 0, Mandatory = $false)]
		[System.String]$Hosts = '*'
	)
	begin {
		try {
		}
		catch {
		}
	}
	process {
		try {
			$vmHosts = Get-VMHost $vmHosts
			$vms = Get-VM
		}
		catch {
			$_
		}
		
		try {
			ForEach ($vmHost in $vmHosts) {
				
				$vCPUs = 0
				$ratio = $null
				$hostThreads = $vmhost.extensiondata.hardware.cpuinfo.numcputhreads
				$vms | Where-Object { $_.vmhost -like $vmHost } | ForEach-Object { $vCPUs += $_.numcpu }
				if ($vCPUs -ne '0') { $ratio = "$("{0:N2}" -f ($vCPUs/$hostThreads))" + ":1" }
				
				[pscustomobject][Ordered]@{
					Hostname = $vmHost.Name
					PhysicalThreads = $hostThreads
					vCPUs = $vCPUs
					Ratio = $ratio
				}
			}
		}
		catch {
			$_
		}
	}
	end {
		try {
		}
		catch {
		}
	}
}