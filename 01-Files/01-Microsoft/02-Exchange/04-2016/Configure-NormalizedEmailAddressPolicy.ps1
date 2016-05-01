<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2016 v5.2.120
	 Created on:   	2016-05-01 2:20 AM
	 Created by:   	Richard Diphoorn
	 Twitter:		https://twitter.com/rdtechie
	 Organization: 	Platani Nederland B.V.
	 Filename:		Configure-NormalizedEmailAddressPolicy.ps1
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

# This code will do the following:
# * <1st character of givenname><surname>@foo.bar
# * <1st character of givenname>.<surname>@foo.bar
# * <givenname>.<surname>@foo.bar
# * All characters in lowercase
# * Replace special non-accepted characters with accepted characters (RFC's 5322, 5321 & 3696)

# To modify an existing policy:
$domainName = 'foobar.guru'
Set-EmailAddressPolicy –Identity 'FOOBAR' –EnabledEmailAddressTemplates "SMTP:%råa%räa%röo%rÅa%rÄa%rÖo%rAa%rBb%rCc%rDd%rEe%rFf%rGg%rHh%rIi%rJj%rKk%rLl%rMm%rNn%rOo%rPp%rQq%rRr%rSs%rTt%rUu%rVv%rWw%rXx%rYy%rZz%1g%rAa%rBb%rCc%rDd%rEe%rFf%rGg%rHh%rIi%rJj%rKk%rLl%rMm%rNn%rOo%rPp%rQq%rRr%rSs%rTt%rUu%rVv%rWw%rXx%rYy%rZz%s@$domainName", "smtp:%råa%räa%röo%rÅa%rÄa%rÖo%rAa%rBb%rCc%rDd%rEe%rFf%rGg%rHh%rIi%rJj%rKk%rLl%rMm%rNn%rOo%rPp%rQq%rRr%rSs%rTt%rUu%rVv%rWw%rXx%rYy%rZz%1g.%rAa%rBb%rCc%rDd%rEe%rFf%rGg%rHh%rIi%rJj%rKk%rLl%rMm%rNn%rOo%rPp%rQq%rRr%rSs%rTt%rUu%rVv%rWw%rXx%rYy%rZz%s@$domainName", "smtp:%råa%räa%röo%rÅa%rÄa%rÖo%rAa%rBb%rCc%rDd%rEe%rFf%rGg%rHh%rIi%rJj%rKk%rLl%rMm%rNn%rOo%rPp%rQq%rRr%rSs%rTt%rUu%rVv%rWw%rXx%rYy%rZz%g.%rAa%rBb%rCc%rDd%rEe%rFf%rGg%rHh%rIi%rJj%rKk%rLl%rMm%rNn%rOo%rPp%rQq%rRr%rSs%rTt%rUu%rVv%rWw%rXx%rYy%rZz%s@$domainName"

# To create a new policy:
$domainName = 'foobar.guru'
New-EmailAddressPolicy –Name 'FOOBAR' -IncludedRecipients AllRecipients –EnabledEmailAddressTemplates "SMTP:%råa%räa%röo%rÅa%rÄa%rÖo%rAa%rBb%rCc%rDd%rEe%rFf%rGg%rHh%rIi%rJj%rKk%rLl%rMm%rNn%rOo%rPp%rQq%rRr%rSs%rTt%rUu%rVv%rWw%rXx%rYy%rZz%1g%rAa%rBb%rCc%rDd%rEe%rFf%rGg%rHh%rIi%rJj%rKk%rLl%rMm%rNn%rOo%rPp%rQq%rRr%rSs%rTt%rUu%rVv%rWw%rXx%rYy%rZz%s@$domainName", "smtp:%råa%räa%röo%rÅa%rÄa%rÖo%rAa%rBb%rCc%rDd%rEe%rFf%rGg%rHh%rIi%rJj%rKk%rLl%rMm%rNn%rOo%rPp%rQq%rRr%rSs%rTt%rUu%rVv%rWw%rXx%rYy%rZz%1g.%rAa%rBb%rCc%rDd%rEe%rFf%rGg%rHh%rIi%rJj%rKk%rLl%rMm%rNn%rOo%rPp%rQq%rRr%rSs%rTt%rUu%rVv%rWw%rXx%rYy%rZz%s@$domainName", "smtp:%råa%räa%röo%rÅa%rÄa%rÖo%rAa%rBb%rCc%rDd%rEe%rFf%rGg%rHh%rIi%rJj%rKk%rLl%rMm%rNn%rOo%rPp%rQq%rRr%rSs%rTt%rUu%rVv%rWw%rXx%rYy%rZz%g.%rAa%rBb%rCc%rDd%rEe%rFf%rGg%rHh%rIi%rJj%rKk%rLl%rMm%rNn%rOo%rPp%rQq%rRr%rSs%rTt%rUu%rVv%rWw%rXx%rYy%rZz%s@$domainName"

