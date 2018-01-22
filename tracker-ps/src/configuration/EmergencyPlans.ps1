########################################################
##
## EmergencyPlans.ps1
## Management interface to IQuipsys tracker
## Emergency plans commands
##
#######################################################


function Get-IqpEmergencyPlans
{
<#
.SYNOPSIS

Gets page with emergency plans by specified criteria

.DESCRIPTION

Gets a page with emergency plans that satisfy specified criteria

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

Get-IqpEmergencyPlans -SiteId 1 -Filter @{ search="fire" } -Take 10

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
        $route = "/api/v1/sites/{0}/emergency_plans" -f $SiteId

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


function Get-IqpEmergencyPlan
{
<#
.SYNOPSIS

Gets emergency plan by id

.DESCRIPTION

Gets emergency plan by its unique id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A object id

.EXAMPLE

Get-IqpEmergencyPlan -SiteId 1 -Id 123

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
        $route = "/api/v1/sites/{0}/emergency_plans/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Get" -Route $route
        
        Write-Output $result
    }
    end {}
}


function New-IqpEmergencyPlan
{
<#
.SYNOPSIS

Creates a new emergency plan

.DESCRIPTION

Creates a new emergency plan

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Plan

A object with the following structure:
- id: string
- site_id: string
- name: string
- steps: EmergencyStepV1[]
  - index: number
  - name: string
  - actions: EmergencyActionV1[]
    type: string
    params: any

.EXAMPLE

New-IqpEmergencyPlan -SiteId 1 -Plan @{ site_id="1"; name="Aliens invasion"; steps=@( @{ index=0; name="Start praying alien god" } ) }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Plan
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/emergency_plans" -f $SiteId

        $result = Invoke-PipFacade -Connection $Connection -Method "Post" -Route $route -Request $Plan
        
        Write-Output $result
    }
    end {}
}


function Update-IqpEmergencyPlan
{
<#
.SYNOPSIS

Creates a new emergency plan

.DESCRIPTION

Creates a new emergency plan

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Plan

A object with the following structure:
- id: string
- site_id: string
- name: string
- steps: EmergencyStepV1[]
  - index: number
  - name: string
  - actions: EmergencyActionV1[]
    type: string
    params: any

.EXAMPLE

Update-IqpEmergencyPlan -SiteId 1 -Plan @{ site_id="1"; name="Aliens invasion"; steps=@( @{ index=0; name="Start praying alien god" } ) }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Plan
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/emergency_plans/{1}" -f $SiteId, $Plan.id

        $result = Invoke-PipFacade -Connection $Connection -Method "Put" -Route $route -Request $Plan
        
        Write-Output $result
    }
    end {}
}


function Remove-IqpEmergencyPlan
{
<#
.SYNOPSIS

Removes emergency plan by id

.DESCRIPTION

Removes emergency plan by its unique id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A emergency plan id

.EXAMPLE

Remove-IqpEmergencyPlan -SiteId 1 -Id 123

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
        $route = "/api/v1/sites/{0}/emergency_plans/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Delete" -Route $route
        
        Write-Output $result
    }
    end {}
}