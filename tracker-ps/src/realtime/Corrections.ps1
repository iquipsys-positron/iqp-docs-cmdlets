########################################################
##
## Corrections.ps1
## Management interface to IQuipsys tracker
## Corrections commands
##
#######################################################


function Get-IqsCorrections
{
<#
.SYNOPSIS

Gets page with corrections by specified criteria

.DESCRIPTION

Gets a page with corrections that satisfy specified criteria

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

Get-IqsCorrections -SiteId 1 -Filter @{ type="object" } -Take 10

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
        $route = "/api/v1/sites/{0}/corrections" -f $SiteId

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


function Get-IqsCorrection
{
<#
.SYNOPSIS

Gets correction by id

.DESCRIPTION

Gets correction by its unique id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A correction id

.EXAMPLE

Get-IqsCorrection -SiteId 1 -Id 123

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
        $route = "/api/v1/sites/{0}/corrections/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Get" -Route $route
        
        Write-Output $result
    }
    end {}
}


function New-IqsCorrection
{
<#
.SYNOPSIS

Creates a new correction

.DESCRIPTION

Creates a new correction

.PARAMETER SiteId

A site id

.PARAMETER Connection

A connection object

.PARAMETER Correction

A correction with the following structure:
- id: string
- site_id: string
- object_id: string
- group_id: string
- reason: string
- status: string
- changes: CorrectionChangeV1[]
  - param_name: string
  - rule_id: string
  - zone_id: string
  - value: number

.EXAMPLE

New-IqsCorrection -SiteId 1 -Correction @{ site_id="1"; object_id="1"; status="Requested"; reason="Test"; changes=@( @{ param_name="distance"; value=10 } ) }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Correction
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/corrections" -f $SiteId

        $result = Invoke-PipFacade -Connection $Connection -Method "Post" -Route $route -Request $Correction
        
        Write-Output $result
    }
    end {}
}


function Update-IqsCorrection
{
<#
.SYNOPSIS

Creates a new correction

.DESCRIPTION

Creates a new correction

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Correction

A correction with the following structure:
- id: string
- site_id: string
- object_id: string
- group_id: string
- reason: string
- status: string
- changes: CorrectionChangeV1[]
  - param_name: string
  - rule_id: string
  - zone_id: string
  - value: number

.EXAMPLE

Update-IqsCorrection -SiteId 1 -Correction @{ site_id="1"; object_id="1"; status="Requested"; reason="Test"; changes=@( @{ param_name="distance"; value=10 } ) }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Correction
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/corrections/{1}" -f $SiteId, $Correction.id

        $result = Invoke-PipFacade -Connection $Connection -Method "Put" -Route $route -Request $Correction
        
        Write-Output $result
    }
    end {}
}


function Remove-IqsCorrection
{
<#
.SYNOPSIS

Removes correction by id

.DESCRIPTION

Removes correction by its unique id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A correction id

.EXAMPLE

Remove-IqsCorrection -SiteId 1 -Id 123

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
        $route = "/api/v1/sites/{0}/corrections/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Delete" -Route $route
        
        Write-Output $result
    }
    end {}
}
