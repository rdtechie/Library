function Get-VMwareVMThinProvisionedVMDK {
	[CmdletBinding()]
	param (
		[Parameter(Position = 0, Mandatory = $true)]
		[System.String[]]$VMname = '*'
	)
	begin {
		try {
		}
		catch {
		}
	}
	process {
		try {
			$vms = Get-VM $VMname
		}
		catch {
			$_
		}
		try {
			ForEach ($vm in $vms) {
				$view = Get-View $vm
				if ($view.config.hardware.Device.Backing.ThinProvisioned -eq $true) {
					
					[pscustomobject][Ordered]@{
						Name = $vm.Name
						Provisioned = [math]::round($vm.ProvisionedSpaceGB, 2)
						Total = [math]::round(($view.config.hardware.Device | Measure-Object CapacityInKB -Sum).sum/1048576, 2)
						Used = [math]::round($vm.UsedSpaceGB, 2)
						VMDKs = $view.config.hardware.Device.Backing.Filename | Out-String
						Thin = $view.config.hardware.Device.Backing.ThinProvisioned | Out-String
					}
				}
			}
		}
		catch {
		}
	}
	end {
		try {
		}
		catch {
		}
	}
}