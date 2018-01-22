########################################################
##
## ObjectGroups.ps1
## Management interface to IQuipsys tracker
## ObjectGroups commands
##
#######################################################


function Get-IqpObjectGroups
{
<#
.SYNOPSIS

Gets page with groups by specified criteria

.DESCRIPTION

Gets a page with groups that satisfy specified criteria

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

Get-IqpObjectGroups -SiteId 1 -Filter @{ name="truck" } -Take 10

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
        $route = "/api/v1/sites/{0}/object_groups" -f $SiteId

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


function Get-IqpObjectGroup
{
<#
.SYNOPSIS

Gets group by id

.DESCRIPTION

Gets group by its unique id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A group id

.EXAMPLE

Get-IqpObjectGroup -SiteId 1 -Id 123

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
        $route = "/api/v1/sites/{0}/object_groups/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Get" -Route $route
        
        Write-Output $result
    }
    end {}
}


function New-IqpObjectGroup
{
<#
.SYNOPSIS

Creates a new group

.DESCRIPTION

Creates a new group

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Group

A group with the following structure:
- id: string
- site_id: string
- name: string
- object_ids: string[]

.EXAMPLE

New-IqpObjectGroup -SiteId 1 -Group @{ site_id="1"; name="Pickups"; object_ids=@("1", "2") }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Group
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/object_groups" -f $SiteId

        $result = Invoke-PipFacade -Connection $Connection -Method "Post" -Route $route -Request $Group
        
        Write-Output $result
    }
    end {}
}


function Update-IqpObjectGroup
{
<#
.SYNOPSIS

Creates a new group

.DESCRIPTION

Creates a new group

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Group

A group with the following structure:
- id: string
- site_id: string
- name: string
- object_ids: string[]

.EXAMPLE

Update-IqpObjectGroup -SiteId 1 -Group @{ site_id="1"; name="Pickups"; object_ids=@("1", "2") }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipelineByPropertyName=$true)]
        [string] $SiteId,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Group
    )
    begin {}
    process 
    {
        $route = "/api/v1/sites/{0}/object_groups/{1}" -f $SiteId, $Group.id

        $result = Invoke-PipFacade -Connection $Connection -Method "Put" -Route $route -Request $Group
        
        Write-Output $result
    }
    end {}
}


function Remove-IqpObjectGroup
{
<#
.SYNOPSIS

Removes group by id

.DESCRIPTION

Removes group by its unique id

.PARAMETER Connection

A connection object

.PARAMETER SiteId

A site id

.PARAMETER Id

A group id

.EXAMPLE

Remove-IqpObjectGroup -SiteId 1 -Id 123

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
        $route = "/api/v1/sites/{0}/object_groups/{1}" -f $SiteId, $Id

        $result = Invoke-PipFacade -Connection $Connection -Method "Delete" -Route $route
        
        Write-Output $result
    }
    end {}
}