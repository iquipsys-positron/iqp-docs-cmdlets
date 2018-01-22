########################################################
##
## Signals.ps1
## Management interface to IQuipsys tracker
## Signals commands
##
#######################################################


function Get-IqpSignals
{
<#
.SYNOPSIS

Gets page with signals by specified criteria

.DESCRIPTION

Gets a page with signals that satisfy specified criteria

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

Get-IqpSignals -SiteId 1 -Filter @{ site_id="123" } -Take 10

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
        $route = "/api/v1/sites/{0}/signals" -f $SiteId

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


function Send-IqpSignal
{
<#
.SYNOPSIS

Sends a signal to device

.DESCRIPTION

Creates a new signal

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Signal

A signal with the following structure:
- id: string
- site_id: string
- device_id: string
- type: number (1: Attention, 2: Confirmation, 3: Warning, 4: Emergency)

.EXAMPLE

Send-IqpSignal -SiteId 1 -Signal @{ site_id="1"; device_id="123"; type=3 }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Signal
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/signals" -f $SiteId

        $result = Invoke-PipFacade -Connection $Connection -Method "Post" -Route $route -Request $Signal
        
        Write-Output $result
    }
    end {}
}


function Lock-IqpSignal
{
<#
.SYNOPSIS

Locks signal by id

.DESCRIPTION

Puts a temporary lock on signal by its unique id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A signal id

.EXAMPLE

Lock-IqpSignal -SiteId 1 -Id 123

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
        $route = "/api/v1/sites/{0}/signals/{1}/lock" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Post" -Route $route
        
        Write-Output $result
    }
    end {}
}


function Complete-IqpSignal
{
<#
.SYNOPSIS

Completes signal delivery by id

.DESCRIPTION

Marks signal as sent to complete its delivery

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A signal id

.EXAMPLE

Complete-IqpSignal -SiteId 1 -Id 123

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
        $route = "/api/v1/sites/{0}/signals/{1}/close" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Post" -Route $route
        
        Write-Output $result
    }
    end {}
}

function Remove-IqpSignal
{
<#
.SYNOPSIS

Removes signal by id

.DESCRIPTION

Removes signal by its unique id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A signal id

.EXAMPLE

Remove-IqpSignal -SiteId 1 -Id 123

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
        $route = "/api/v1/sites/{0}/signals/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Delete" -Route $route
        
        Write-Output $result
    }
    end {}
}
