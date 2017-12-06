########################################################
##
## Zones.ps1
## Management interface to IQuipsys tracker
## Zones commands
##
#######################################################


function Get-IqtZones
{
<#
.SYNOPSIS

Gets page with zones by specified criteria

.DESCRIPTION

Gets a page with zones that satisfy specified criteria

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

Get-IqtZones -SiteId 1 -Filter @{ type="object" } -Take 10

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
        $route = "/api/v1/sites/{0}/zones" -f $SiteId

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


function Get-IqtZone
{
<#
.SYNOPSIS

Gets zone by id

.DESCRIPTION

Gets zone by its unique id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A zone id

.EXAMPLE

Get-IqtZone -SiteId 1 -Id 123

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
        $route = "/api/v1/sites/{0}/zones/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Get" -Route $route
        
        Write-Output $result
    }
    end {}
}


function New-IqtZone
{
<#
.SYNOPSIS

Creates a new zone

.DESCRIPTION

Creates a new zone

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Zone

A zone with the following structure:
- id: string
- site_id: string
- type: string
- name: string
- center: any
- distance: number
- geometry: any
- include_object_ids: string[]
- include_group_ids: string[]
- exclude_object_ids: string[]
- exclude_group_ids: string[]

.EXAMPLE

New-IqtZone -SiteId 1 -Zone @{ site_id="1"; type="circle"; name="Parking"; center=@{ type="Point"; coordinates=@(32, -110) }; distance=300 }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Zone
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/zones" -f $SiteId

        $result = Invoke-PipFacade -Connection $Connection -Method "Post" -Route $route -Request $Zone
        
        Write-Output $result
    }
    end {}
}


function Update-IqtZone
{
<#
.SYNOPSIS

Creates a new zone

.DESCRIPTION

Creates a new zone

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Zone

A zone with the following structure:
- id: string
- site_id: string
- type: string
- name: string
- center: any
- distance: number
- geometry: any
- include_object_ids: string[]
- include_group_ids: string[]
- exclude_object_ids: string[]
- exclude_group_ids: string[]

.EXAMPLE

Update-IqtZone -SiteId 1 -Zone @{ site_id="1"; type="circle"; name="Parking"; center=@{ type="Point"; coordinates=@(32, -110) }; distance=300 }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Zone
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/zones/{1}" -f $SiteId, $Zone.id

        $result = Invoke-PipFacade -Connection $Connection -Method "Put" -Route $route -Request $Zone
        
        Write-Output $result
    }
    end {}
}


function Remove-IqtZone
{
<#
.SYNOPSIS

Removes zone by id

.DESCRIPTION

Removes zone by its unique id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A zone id

.EXAMPLE

Remove-IqtZone -SiteId 1 -Id 123

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
        $route = "/api/v1/sites/{0}/zones/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Delete" -Route $route
        
        Write-Output $result
    }
    end {}
}
