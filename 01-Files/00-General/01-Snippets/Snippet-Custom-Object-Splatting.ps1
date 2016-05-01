<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2016 v5.2.120
	 Created on:   	2016-05-01 3:04 AM
	 Created by:   	Richard Diphoorn
	 Organization: 	
	 Filename:     	Snippet-Custom-Object-Splatting
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

$customObject = [ordered]@{
	Name = '<name>'
	Job = '<jobname>'
	Company = '<companyname>'
	EMail = '<mailaddress>'
	BloggerAt = 'http://<url>'
	ModeratorAt = 'http://<url>'
	Twitter = 'http://twitter.com/<username>'
	GitHub = 'https://github.com/<username>'
}

New-Object -TypeName PSObject -ArgumentList $customObject