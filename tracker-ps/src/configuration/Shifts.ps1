########################################################
##
## Shifts.ps1
## Management interface to IQuipsys tracker
## Shifts commands
##
#######################################################


function Get-IqpShifts
{
<#
.SYNOPSIS

Gets page with shifts by specified criteria

.DESCRIPTION

Gets a page with shifts that satisfy specified criteria

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

Get-IqpShifts -SiteId 1 -Take 10

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
        $route = "/api/v1/sites/{0}/shifts" -f $SiteId

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


function Get-IqpShift
{
<#
.SYNOPSIS

Gets shift by id

.DESCRIPTION

Gets shift by its unique id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A shift id

.EXAMPLE

Get-IqpShift -SiteId 1 -Id 123

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
        $route = "/api/v1/sites/{0}/shifts/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Get" -Route $route
        
        Write-Output $result
    }
    end {}
}


function New-IqpShift
{
<#
.SYNOPSIS

Creates a new shift

.DESCRIPTION

Creates a new shift

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Shift

A shift with the following structure:
- id: string
- site_id: string
- name: string
- start: number
- duration: number

.EXAMPLE

New-IqpShift -SiteId 1 -Shift @{ site_id="1"; name="Night shift"; start=0; duration=480 }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Shift
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/shifts" -f $SiteId

        $result = Invoke-PipFacade -Connection $Connection -Method "Post" -Route $route -Request $Shift
        
        Write-Output $result
    }
    end {}
}


function Update-IqpShift
{
<#
.SYNOPSIS

Creates a new shift

.DESCRIPTION

Creates a new shift

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Shift

A shift with the following structure:
- id: string
- site_id: string
- name: string
- start: number
- duration: number

.EXAMPLE

Update-IqpShift -SiteId 1 -Shift @{ site_id="1"; name="Night shift"; start=0; duration=480 }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Shift
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/shifts/{1}" -f $SiteId, $Shift.id

        $result = Invoke-PipFacade -Connection $Connection -Method "Put" -Route $route -Request $Shift
        
        Write-Output $result
    }
    end {}
}


function Remove-IqpShift
{
<#
.SYNOPSIS

Removes shift by id

.DESCRIPTION

Removes shift by its unique id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A shift id

.EXAMPLE

Remove-IqpShift -SiteId 1 -Id 123

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
        $route = "/api/v1/sites/{0}/shifts/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Delete" -Route $route
        
        Write-Output $result
    }
    end {}
}
