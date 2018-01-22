########################################################
##
## Rules.ps1
## Management interface to IQuipsys tracker
## Rules commands
##
#######################################################


function Get-IqpRules
{
<#
.SYNOPSIS

Gets page with rules by specified criteria

.DESCRIPTION

Gets a page with rules that satisfy specified criteria

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

Get-IqpRules -SiteId 1 -Filter @{ type="object" } -Take 10

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
        $route = "/api/v1/sites/{0}/rules" -f $SiteId

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


function Get-IqpRule
{
<#
.SYNOPSIS

Gets rule by id

.DESCRIPTION

Gets rule by its unique id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A rule id

.EXAMPLE

Get-IqpRule -SiteId 1 -Id 123

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
        $route = "/api/v1/sites/{0}/rules/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Get" -Route $route
        
        Write-Output $result
    }
    end {}
}


function New-IqpRule
{
<#
.SYNOPSIS

Creates a new rule

.DESCRIPTION

Creates a new rule

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Rule

A rule with the following structure:
- id: string
- site_id: string
- name: string
- type: string
- condition: any
- severity: number
- interval: number
- incident: boolean
- send_email: boolean
- emails: string[]
- send_signal: boolean
- signals: number
- include_object_ids: string[]
- exclude_object_ids: string[]
- include_group_ids: string[]
- exclude_group_ids: string[]
- include_zone_ids: string[]
- exclude_zone_ids: string[]

.EXAMPLE

New-IqpRule -SiteId 1 -Rule @{ site_id="1"; type="Presence"; name="Present in area"; event_type="auto" }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Rule
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/rules" -f $SiteId

        $result = Invoke-PipFacade -Connection $Connection -Method "Post" -Route $route -Request $Rule
        
        Write-Output $result
    }
    end {}
}


function Update-IqpRule
{
<#
.SYNOPSIS

Creates a new rule

.DESCRIPTION

Creates a new rule

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Rule

A rule with the following structure:
- id: string
- site_id: string
- name: string
- type: string
- condition: any
- severity: number
- interval: number
- incident: boolean
- send_email: boolean
- emails: string[]
- send_signal: boolean
- signals: number
- include_object_ids: string[]
- exclude_object_ids: string[]
- include_group_ids: string[]
- exclude_group_ids: string[]
- include_zone_ids: string[]
- exclude_zone_ids: string[]

.EXAMPLE

Update-IqpRule -SiteId 1 -Rule @{ site_id="1"; type="Presence"; name="Present in area"; event_type="auto" }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Rule
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/rules/{1}" -f $SiteId, $Rule.id

        $result = Invoke-PipFacade -Connection $Connection -Method "Put" -Route $route -Request $Rule
        
        Write-Output $result
    }
    end {}
}


function Remove-IqpRule
{
<#
.SYNOPSIS

Removes rule by id

.DESCRIPTION

Removes rule by its unique id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A rule id

.EXAMPLE

Remove-IqpRule -SiteId 1 -Id 123

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
        $route = "/api/v1/sites/{0}/rules/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Delete" -Route $route
        
        Write-Output $result
    }
    end {}
}
