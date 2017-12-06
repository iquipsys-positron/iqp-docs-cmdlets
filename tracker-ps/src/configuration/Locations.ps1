########################################################
##
## Locations.ps1
## Management interface to IQuipsys tracker
## Locations commands
##
#######################################################


function Get-IqtLocations
{
<#
.SYNOPSIS

Gets page with locations by specified criteria

.DESCRIPTION

Gets a page with locations that satisfy specified criteria

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Filter

A filter with search criteria (default: no filter)

.PARAMETER Skip

A number of records to skip (default: 0)

.PARAMETER Take

A number of records to return (default: 100)

.PARAMETER Total

A include total count (default: false)

.EXAMPLE

Get-IqtLocations -SiteId 1 -Filter @{ search="gate" } -Take 10

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$false, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Filter = @{},
        [Parameter(Mandatory=$false, Position = 2, ValueFromPipelineByPropertyName=$true)]
        [int] $Skip = 0,
        [Parameter(Mandatory=$false, Position = 3, ValueFromPipelineByPropertyName=$true)]
        [int] $Take = 100,
        [Parameter(Mandatory=$false, Position = 4, ValueFromPipelineByPropertyName=$true)]
        [bool] $Total
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/locations" -f $SiteId

        $params = $Filter +
        @{ 
            skip = $Skip;
            take = $Take
            total = $Total
        }

        $result = Invoke-PipFacade -Connection $Connection -Method "Get" -Route $route -Params $params

        Write-Output $result.Data
    }
    end {}
}


function Get-IqtLocation
{
<#
.SYNOPSIS

Gets location by id

.DESCRIPTION

Gets location by its unique id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A location id

.EXAMPLE

Get-IqtLocation -SiteId 1 -Id 123

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string] $Id
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/locations/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Get" -Route $route
        
        Write-Output $result
    }
    end {}
}


function New-IqtLocation
{
<#
.SYNOPSIS

Creates a new location

.DESCRIPTION

Creates a new location

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Location

A location with the following structure:
- id: string
- site_id: string
- name: string
- pos: any - GeoJSON

.EXAMPLE

New-IqtLocation -SiteId 1 -Location @{ site_id="1"; name="Main gate"; pos=${ type="Point"; coordinates=@(32.11, -100.45) } }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Location
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/locations" -f $SiteId

        $result = Invoke-PipFacade -Connection $Connection -Method "Post" -Route $route -Request $Location
        
        Write-Output $result
    }
    end {}
}


function Update-IqtLocation
{
<#
.SYNOPSIS

Creates a new location

.DESCRIPTION

Creates a new location

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Location

A location with the following structure:
- id: string
- site_id: string
- name: string
- pos: any - GeoJSON

.EXAMPLE

Update-IqtLocation -SiteId 1 -Location @{ site_id="1"; name="Main gate"; pos=${ type="Point"; coordinates=@(32.11, -100.45) } }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Location
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/locations/{1}" -f $SiteId, $Location.id

        $result = Invoke-PipFacade -Connection $Connection -Method "Put" -Route $route -Request $Location
        
        Write-Output $result
    }
    end {}
}


function Remove-IqtLocation
{
<#
.SYNOPSIS

Removes location by id

.DESCRIPTION

Removes location by its unique id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A location id

.EXAMPLE

Remove-IqtLocation -SiteId 1 -Id 123

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string] $Id
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/locations/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Delete" -Route $route
        
        Write-Output $result
    }
    end {}
}