########################################################
##
## Sites.ps1
## Management interface to IQuipsys tracker
## Sites commands
##
#######################################################


function Get-IqsSites
{
<#
.SYNOPSIS

Gets page with sites by specified criteria

.DESCRIPTION

Gets a page with sites that satisfy specified criteria

.PARAMETER Connection

A connection object

.PARAMETER Filter

A filter with search criteria (default: no filter)

.PARAMETER Skip

A number of records to skip (default: 0)

.PARAMETER Take

A number of records to return (default: 100)

.PARAMETER Total

A include total count (default: false)

.EXAMPLE

Get-IqsSites -Filter @{ ids=@("1", "2") } -Take 10

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$false, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Filter = @{},
        [Parameter(Mandatory=$false, Position = 1, ValueFromPipelineByPropertyName=$true)]
        [int] $Skip = 0,
        [Parameter(Mandatory=$false, Position = 2, ValueFromPipelineByPropertyName=$true)]
        [int] $Take = 100,
        [Parameter(Mandatory=$false, Position = 3, ValueFromPipelineByPropertyName=$true)]
        [bool] $Total
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites"

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


function Get-IqsSite
{
<#
.SYNOPSIS

Gets site by id

.DESCRIPTION

Gets site by its unique id

.PARAMETER Connection

A connection object

.PARAMETER Id

A site id

.EXAMPLE

Get-IqsSite -Id 123

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string] $Id
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}" -f $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Get" -Route $route
        
        Write-Output $result
    }
    end {}
}


function New-IqsSite
{
<#
.SYNOPSIS

Creates a new site

.DESCRIPTION

Creates a new site

.PARAMETER Connection

A connection object

.PARAMETER Site

A site with the following structure:
- id: string
- code: string
- active: boolean
- name: string
- description: string
- address: string
- center: any - GeoJSON
- radius?: number - In km
- geometry: any - GeoJSON
- map_id: string - Blob id with map background
- map_north: number
- map_south: number
- map_west: number
- map_east: number

.EXAMPLE

New-IqsSite -Site @{ code="COOL123"; name="Cool mine"; active=$true }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Site
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites"

        $result = Invoke-PipFacade -Connection $Connection -Method "Post" -Route $route -Request $Site
        
        Write-Output $result
    }
    end {}
}


function Update-IqsSite
{
<#
.SYNOPSIS

Creates a new site

.DESCRIPTION

Creates a new site

.PARAMETER Connection

A connection object

.PARAMETER Site

A site with the following structure:
- id: string
- code: string
- active: boolean
- name: string
- description: string
- address: string
- center: any - GeoJSON
- radius?: number - In km
- geometry: any - GeoJSON
- map_id: string - Blob id with map background
- map_north: number
- map_south: number
- map_west: number
- map_east: number

.EXAMPLE

Update-IqsSite -Site @{ code="COOL123"; name="Cool mine"; active=$true }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Site
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}" -f $Site.id

        $result = Invoke-PipFacade -Connection $Connection -Method "Put" -Route $route -Request $Site
        
        Write-Output $result
    }
    end {}
}


function Remove-IqsSite
{
<#
.SYNOPSIS

Removes site by id

.DESCRIPTION

Removes site by its unique id

.PARAMETER Connection

A connection object

.PARAMETER Id

A site id

.EXAMPLE

Remove-IqsSite -Id 123

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string] $Id
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}" -f $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Delete" -Route $route
        
        Write-Output $result
    }
    end {}
}


function Get-IqsSiteUsers
{
<#
.SYNOPSIS

Gets page with site users by site id

.DESCRIPTION

Gets a page with site users by site id

.PARAMETER Connection

A connection object

.PARAMETER Id

A site id

.PARAMETER Skip

A number of records to skip (default: 0)

.PARAMETER Take

A number of records to return (default: 100)

.PARAMETER Total

A include total count (default: false)

.EXAMPLE

Get-IqsSiteUsers -Id 123 -Take 10

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string] $Id,
        [Parameter(Mandatory=$false, Position = 1, ValueFromPipelineByPropertyName=$true)]
        [int] $Skip = 0,
        [Parameter(Mandatory=$false, Position = 2, ValueFromPipelineByPropertyName=$true)]
        [int] $Take = 100,
        [Parameter(Mandatory=$false, Position = 3, ValueFromPipelineByPropertyName=$true)]
        [bool] $Total
    )
    begin {}
    process 
    {
        $route = "/api/v1/site_users"

        $params = @{ 
            site_id = $Id;
            skip = $Skip;
            take = $Take
            total = $Total
        }

        $result = Invoke-PipFacade -Connection $Connection -Method "Get" -Route $route -Params $params

        Write-Output $result.Data
    }
    end {}
}