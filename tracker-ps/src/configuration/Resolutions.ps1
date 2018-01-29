########################################################
##
## Resolutions.ps1
## Management interface to IQuipsys tracker
## Resolutions commands
##
#######################################################


function Get-IqsResolutions
{
<#
.SYNOPSIS

Gets page with resolutions by specified criteria

.DESCRIPTION

Gets a page with resolutions that satisfy specified criteria

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

Get-IqsResolutions -SiteId 1 -Filter @{ search="gate" } -Take 10

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
        $route = "/api/v1/sites/{0}/resolutions" -f $SiteId

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


function Get-IqsResolution
{
<#
.SYNOPSIS

Gets resolution by id

.DESCRIPTION

Gets resolution by its unique id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A resolution id

.EXAMPLE

Get-IqsResolution -SiteId 1 -Id 123

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
        $route = "/api/v1/sites/{0}/resolutions/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Get" -Route $route
        
        Write-Output $result
    }
    end {}
}


function New-IqsResolution
{
<#
.SYNOPSIS

Creates a new resolution

.DESCRIPTION

Creates a new resolution

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Resolution

A resolution with the following structure:
- id: string
- site_id: string
- rule_id: string
- resolution: string

.EXAMPLE

New-IqsResolution -SiteId 1 -Resolution @{ site_id="1"; rule_id="1"; resolution="Escalated to management" }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Resolution
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/resolutions" -f $SiteId

        $result = Invoke-PipFacade -Connection $Connection -Method "Post" -Route $route -Request $Resolution
        
        Write-Output $result
    }
    end {}
}


function Update-IqsResolution
{
<#
.SYNOPSIS

Creates a new resolution

.DESCRIPTION

Creates a new resolution

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Resolution

A resolution with the following structure:
- id: string
- site_id: string
- rule_id: string
- resolution: string

.EXAMPLE

Update-IqsResolution -SiteId 1 -Resolution @{ site_id="1"; rule_id="1"; resolution="Escalated to management" }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Resolution
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/resolutions/{1}" -f $SiteId, $Resolution.id

        $result = Invoke-PipFacade -Connection $Connection -Method "Put" -Route $route -Request $Resolution
        
        Write-Output $result
    }
    end {}
}


function Remove-IqsResolution
{
<#
.SYNOPSIS

Removes resolution by id

.DESCRIPTION

Removes resolution by its unique id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A resolution id

.EXAMPLE

Remove-IqsResolution -SiteId 1 -Id 123

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
        $route = "/api/v1/sites/{0}/resolutions/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Delete" -Route $route
        
        Write-Output $result
    }
    end {}
}