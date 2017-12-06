########################################################
##
## ObjectPositions.ps1
## Management interface to IQuipsys tracker
## ObjectPositions commands
##
#######################################################


function Get-IqtObjectPositions
{
<#
.SYNOPSIS

Gets page with positions by specified criteria

.DESCRIPTION

Gets a page with positions that satisfy specified criteria

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

Get-IqtObjectPositions -SiteId 1 -Filter @{ object_id="123" } -Take 10

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
        $route = "/api/v1/sites/{0}/object_positions" -f $SiteId

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


function Add-IqtObjectPosition
{
<#
.SYNOPSIS

Adds position to object positions

.DESCRIPTION

Adds position to object positions

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Position

A position with the following structure:
- site_id: string
- object_id: string
- time: Date
- lat: number
- long: number

.EXAMPLE

Add-IqtObjectPosition -SiteId 1 -Position @{ site_id="1"; object_id="123"; lat=1; long=1 }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Position
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/object_positions" -f $SiteId

        $result = Invoke-PipFacade -Connection $Connection -Method "Post" -Route $route -Request $Position
        
        Write-Output $result
    }
    end {}
}


function Add-IqtObjectPositions
{
<#
.SYNOPSIS

Adds multiple object positions

.DESCRIPTION

Adds several positions to object positions

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Positions

A positions with the following structure:
- site_id: string
- object_id: string
- time: Date
- lat: number
- long: number

.EXAMPLE

Add-IqtObjectPositions -SiteId 1 -Positions @( @{ site_id="1"; object_id="123"; lat=1; long=1 }, ... )

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object[]] $Positions
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/object_positions/batch" -f $SiteId

        $result = Invoke-PipFacade -Connection $Connection -Method "Post" -Route $route -Request $Positions
        
        Write-Output $result
    }
    end {}
}


function Remove-IqtObjectPositions
{
<#
.SYNOPSIS

Removes positions by filter

.DESCRIPTION

Removes positions that match specified filter

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Filter

A filter with search criteria (default: no filter)

.EXAMPLE

# Delete positions for object 123
Remove-IqtObjectPositions -SiteId 1 -Filter @{ object_id="123" }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$false, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Filter = @{}
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/object_positions" -f $SiteId

        $result = Invoke-PipFacade -Connection $Connection -Method "Delete" -Route $route -Params $Filter
        
        Write-Output $result
    }
    end {}
}