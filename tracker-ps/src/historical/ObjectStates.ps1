########################################################
##
## ObjectStates.ps1
## Management interface to IQuipsys tracker
## ObjectStates commands
##
#######################################################


function Get-IqsObjectStates
{
<#
.SYNOPSIS

Gets page with states by specified criteria

.DESCRIPTION

Gets a page with states that satisfy specified criteria

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Time

A specified timeline to retrieve states

.PARAMETER Filter

A filter with search criteria (default: no filter)

.PARAMETER Skip

A number of records to skip (default: 0)

.PARAMETER Take

A number of records to return (default: 100)

.PARAMETER Total

A include total count (default: false)

.EXAMPLE

Get-IqsObjectStates -SiteId 1 -Filter @{ object_id="123" } -Take 10

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
        [bool] $Total,
        [Parameter(Mandatory=$false, Position = 5, ValueFromPipelineByPropertyName=$true)]
        [DateTime] $Time
    )
    begin {}
    process 
    {
        if ($Time -ne $null) {
            $route = "/api/v1/sites/{0}/object_states/timeline" -f $SiteId

            $params = $Filter +
            @{ 
                time = $Time
            }

            $result = Invoke-PipFacade -Connection $Connection -Method "Get" -Route $route -Params $params

            Write-Output $result
        } else {
            $route = "/api/v1/sites/{0}/object_states" -f $SiteId

            $params = $Filter +
            @{ 
                skip = $Skip;
                take = $Take
                total = $Total
            }

            $result = Invoke-PipFacade -Connection $Connection -Method "Get" -Route $route -Params $params

            Write-Output $result.Data
        }
    }
    end {}
}


function Add-IqsObjectState
{
<#
.SYNOPSIS

Adds state to object states

.DESCRIPTION

Adds state to object states

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER State

A state with the following structure:
- site_id: string
- device_id: string
- immobile: boolean
- emergency: boolean
- time: Date
- lat: number
- long: number
- alt: number
- angle: number
- speed: number
- online: number
- immobile: number
- emergency: number

.EXAMPLE

Add-IqsObjectState -SiteId 1 -State @{ site_id="1"; device_id="1"; object_id="123"; time=$(Get-Date) lat=1; long=1; online=10; immobile=0; emergency=0 }

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
        $route = "/api/v1/sites/{0}/object_states" -f $SiteId

        $result = Invoke-PipFacade -Connection $Connection -Method "Post" -Route $route -Request $State
        
        Write-Output $result
    }
    end {}
}

function Add-IqsObjectStates
{
<#
.SYNOPSIS

Adds multiple object states

.DESCRIPTION

Adds several states to object states

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER State

A states with the following structure:
- site_id: string
- device_id: string
- immobile: boolean
- emergency: boolean
- time: Date
- lat: number
- long: number
- alt: number
- angle: number
- speed: number
- online: number
- immobile: number
- emergency: number

.EXAMPLE

Add-IqsObjectStates -SiteId 1 -States @( @{ site_id="1"; device_id="1"; object_id="123"; time=$(Get-Date) lat=1; long=1; online=10; immobile=0; emergency=0 }, ... )

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object[]] $States
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/object_states/batch" -f $SiteId

        $result = Invoke-PipFacade -Connection $Connection -Method "Post" -Route $route -Request $States
        
        Write-Output $result
    }
    end {}
}

function Remove-IqsObjectStates
{
<#
.SYNOPSIS

Removes states by filter

.DESCRIPTION

Removes states that match specified filter

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Filter

A filter with search criteria (default: no filter)

.EXAMPLE

Remove-IqsObjectStates -SiteId 1 -Filter @{ object_id="123" }

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
        $route = "/api/v1/sites/{0}/object_states" -f $SiteId

        $result = Invoke-PipFacade -Connection $Connection -Method "Delete" -Route $route -Params $Filter
        
        Write-Output $result
    }
    end {}
}