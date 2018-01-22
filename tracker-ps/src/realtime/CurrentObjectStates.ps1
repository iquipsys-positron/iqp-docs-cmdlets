########################################################
##
## CurrentObjectStates.ps1
## Management interface to IQuipsys tracker
## Current object states commands
##
#######################################################

function Get-IqpCurrentObjectStates
{
<#
.SYNOPSIS

Reads current states for control objects service

.DESCRIPTION

Reads a page of states from currobjectstates service that satisfy specified criteria

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

Read-IqpCurrentObjectStates -SiteId 1 -Take 10

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
        $route = "/api/v1/sites/{0}/curr_object_states" -f $SiteId

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


function Get-IqpCurrentObjectState
{
<#
.SYNOPSIS

Gets current state by device id

.DESCRIPTION

Gets current state by state/device id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A state or device id

.EXAMPLE

Get-IqpCurrentObjectState -SiteId 1 -Id 123

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
        $route = "/api/v1/sites/{0}/curr_object_states/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Get" -Route $route

        Write-Output $result
    }
    end {}
}


function Set-IqpCurrentObjectState
{
<#
.SYNOPSIS

Sets current state of specified object

.DESCRIPTION

Sets current state for control object object

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER State

A current object state with the following structure
- id: string
- site_id: string
- device_id: string
- object_id: string
- assigned_id: string
- online: number
- immobile: number
- time: Date
- pos: any // GeoJSON
- alt: number
- angle: number
- speed: number

.EXAMPLE

Set-IqpCurrentState -SiteId 1 -State @{ site_id="1"; device_id="1"; time=$(Get-Date); immobile=0; emergency=0  }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $State
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/curr_object_states/{1}" -f $SiteId, $State.device_id

        $result = Invoke-PipFacade -Connection $Connection -Method "Put" -Route $route -Request $State
        
        Write-Output $result
    }
    end {}
}


function Update-IqpCurrentObjectState
{
<#
.SYNOPSIS

Updates current state of specified object

.DESCRIPTION

Changes current state, calculates all rules, generates events and logs historical records

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER State

A state update with the following structure
- site_id: string
- device_id: string
- immobile: boolean
- time: Date
- lat: number
- long: number
- alt: number
- angle: number
- speed: number

.EXAMPLE

Update-IqpCurrentState -SiteId 1 -State @{ site_id="1"; device_id="1"; time=$(Get-Date); immobile=$false; emergency=$false  }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $State
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/state_updates" -f $SiteId

        $result = Invoke-PipFacade -Connection $Connection -Method "Post" -Route $route -Request $State
        
        Write-Output $result
    }
    end {}
}


function Remove-IqpCurrentObjectState
{
<#
.SYNOPSIS

Removes current state by device id

.DESCRIPTION

Removes current state by state/device id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A state or device id

.EXAMPLE

Remove-IqpCurrentObjectState -SiteId 1 -Id 123

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
        $route = "/api/v1/sites/{0}/curr_object_states/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Delete" -Route $route

        Write-Output $result
    }
    end {}
}


function Remove-IqpCurrentObjectStates
{
<#
.SYNOPSIS

Removes current states for control objects service

.DESCRIPTION

Removes states from currobjectstates service that satisfy specified criteria

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Filter

A filter with search criteria (default: no filter)

.EXAMPLE

Remove-IqpCurrentObjectStates -SiteId 1

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
        $route = "/api/v1/sites/{0}/curr_object_states" -f $SiteId
        $params = $Filter

        $null = Invoke-PipFacade -Connection $Connection -Method "Delete" -Route $route -Params $params
    }
    end {}
}
function Send-IqpObjectStateUpdate
{
<#
.SYNOPSIS

Updates current state of specified object asynchronously

.DESCRIPTION

Initiate update of the current state, calculates all rules, generates events and logs historical records

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER State

A state update with the following structure
- site_id: string
- device_id: string
- immobile: boolean
- time: Date
- lat: number
- long: number
- alt: number
- angle: number
- speed: number

.EXAMPLE

Send-IqpObjectStateUpdate -SiteId 1 -State @{ site_id="1"; device_id="1"; time=$(Get-Date); immobile=$false; emergency=$false  }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $State
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/begin_update_state" -f $SiteId

        Invoke-PipFacade -Connection $Connection -Method "Post" -Route $route -Request $State
    }
    end {}
}
