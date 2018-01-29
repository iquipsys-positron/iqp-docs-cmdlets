########################################################
##
## Devices.ps1
## Management interface to IQuipsys tracker
## Devices commands
##
#######################################################


function Get-IqsDevices
{
<#
.SYNOPSIS

Gets page with devices by specified criteria

.DESCRIPTION

Gets a page with devices that satisfy specified criteria

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

Get-IqsDevices -SiteId 1 -Filter @{ search="234" } -Take 10

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
        $route = "/api/v1/sites/{0}/devices" -f $SiteId

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


function Get-IqsDevice
{
<#
.SYNOPSIS

Gets device by id

.DESCRIPTION

Gets device by its unique id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A device id

.EXAMPLE

Get-IqsDevice -SiteId 1 -Id 123

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
        $route = "/api/v1/sites/{0}/devices/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Get" -Route $route
        
        Write-Output $result
    }
    end {}
}


function New-IqsDevice
{
<#
.SYNOPSIS

Creates a new device

.DESCRIPTION

Creates a new device

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Device

A device with the following structure:
- id: string
- site_id: string
- type: string
- version: number
- udi: string
- label: string
- create_time: Date
- active: boolean
- deleted: boolean
- object_id: string

.EXAMPLE

New-IqsDevice -SiteId 1 -Device @{ site_id="1"; model="smartphone"; udi="1-520-332-3423"; label="Main gate"; active=$true }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Device
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/devices" -f $SiteId

        $result = Invoke-PipFacade -Connection $Connection -Method "Post" -Route $route -Request $Device
        
        Write-Output $result
    }
    end {}
}


function Update-IqsDevice
{
<#
.SYNOPSIS

Creates a new device

.DESCRIPTION

Creates a new device

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Device

A device with the following structure:
- id: string
- site_id: string
- type: string
- version: number
- udi: string
- label: string
- create_time: Date
- active: boolean
- deleted: boolean
- object_id: string

.EXAMPLE

Update-IqsDevice -SiteId 1 -Device @{ site_id="1"; model="smartphone"; udi="1-520-332-3423"; label="Main gate"; active=$true }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Device
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/devices/{1}" -f $SiteId, $Device.id

        $result = Invoke-PipFacade -Connection $Connection -Method "Put" -Route $route -Request $Device
        
        Write-Output $result
    }
    end {}
}


function Remove-IqsDevice
{
<#
.SYNOPSIS

Removes device by id

.DESCRIPTION

Removes device by its unique id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A device id

.EXAMPLE

Remove-IqsDevice -SiteId 1 -Id 123

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
        $route = "/api/v1/sites/{0}/devices/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Delete" -Route $route
        
        Write-Output $result
    }
    end {}
}