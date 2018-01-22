########################################################
##
## Guides.ps1
## Management interface to IQuipsys tracker
## Guides commands
##
#######################################################


function Get-IqpGuides
{
<#
.SYNOPSIS

Gets page with guides by specified criteria

.DESCRIPTION

Gets a page with guides that satisfy specified criteria

.PARAMETER Connection

A connection object

.PARAMETER Filter

A filter with search criteria (default: no filter)

.PARAMETER Skip

A number of records to skip (default: 0)

.PARAMETER Take

A number of records to return (default: 100)

.PARAMETER Total

A include total count (default: false)

.EXAMPLE

Get-IqpGuides -Filter @{ tags="goals,success" } -Take 10

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$false, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Filter = @{},
        [Parameter(Mandatory=$false, Position = 1, ValueFromPipelineByPropertyName=$true)]
        [int] $Skip = 0,
        [Parameter(Mandatory=$false, Position = 2, ValueFromPipelineByPropertyName=$true)]
        [int] $Take = 100,
        [Parameter(Mandatory=$false, Position = 3, ValueFromPipelineByPropertyName=$true)]
        [bool] $Total
    )
    begin {}
    process 
    {
        Get-PipGuides -Connection $Connection -Method "Get" -Uri "/api/v1/guides" -Filter $Filter -Skip $Skip -Take $Take -Total $Total
    }
    end {}
}


function Get-IqpGuide
{
<#
.SYNOPSIS

Gets guide by id

.DESCRIPTION

Gets guide by its unique id

.PARAMETER Connection

A connection object

.PARAMETER Id

A guide id

.EXAMPLE

Get-IqpGuide -Id 123

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string] $Id
    )
    begin {}
    process 
    {
        Get-PipGuide -Connection $Connection -Method "Get" -Uri "/api/v1/guides/{0}" -Id $Id
    }
    end {}
}


function Get-IqpRandomGuide
{
<#
.SYNOPSIS

Gets a random guide

.DESCRIPTION

Gets a random guide

.PARAMETER Connection

A connection object

.PARAMETER Filter

A filter with search criteria (default: no filter)

.EXAMPLE

Get-IqpRandomGuide

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$false, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Filter = @{}
    )
    begin {}
    process 
    {
        Get-PipRandomGuide -Connection $Connection -Method "Get" -Uri "/api/v1/guides/random" -Filter $Filter
        
        Write-Output $result
    }
    end {}
}


function New-IqpGuide
{
<#
.SYNOPSIS

Creates a new guide

.DESCRIPTION

Creates a new guide

.PARAMETER Connection

A connection object

.PARAMETER Guide

A guide with the following structure:
- id: string
- type: string - "introduction", "new release"
- app: string
- version: string
- pages: GuidePageV1[]
  - title: MultiString
  - content: MultiString
  - more_url: string
  - color: string
  - pic_id: string
  - pic_uri: string
- tags: string[]
- status: string - new, writing, translating, verifying, completed
- custom_hdr: any
- custom_dat: any

.EXAMPLE

New-IqpGuide -Guide @{ type="introduction"; app="MyApp"; pages=@(@{ title=@{ en="Welcome to MyApp" } }); status="completed" }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Guide
    )
    begin {}
    process 
    {
        New-PipGuide -Connection $Connection -Method "Post" -Uri "/api/v1/guides" -Guide $Guide
    }
    end {}
}


function Update-IqpGuide
{
<#
.SYNOPSIS

Creates a new guide

.DESCRIPTION

Creates a new guide

.PARAMETER Connection

A connection object

.PARAMETER Guide

A guide with the following structure:
- id: string
- type: string - "introduction", "new release"
- app: string
- version: string
- pages: GuidePageV1[]
  - title: MultiString
  - content: MultiString
  - more_url: string
  - color: string
  - pic_id: string
  - pic_uri: string
- tags: string[]
- status: string - new, writing, translating, verifying, completed
- custom_hdr: any
- custom_dat: any

.EXAMPLE

Update-IqpGuide -Guide @{ type="introduction"; app="MyApp"; pages=@(@{ title=@{ en="Welcome to MyApp" } }); status="completed" }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Guide
    )
    begin {}
    process 
    {
        Update-PipGuide -Connection $Connection -Method "Put" -Uri "/api/v1/guides/{0}" -Guide $Guide
    }
    end {}
}


function Remove-IqpGuide
{
<#
.SYNOPSIS

Removes guide by id

.DESCRIPTION

Removes guide by its unique id

.PARAMETER Connection

A connection object

.PARAMETER Id

A guide id

.EXAMPLE

Remove-IqpGuide -Id 123

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string] $Id
    )
    begin {}
    process 
    {
        Remove-PipGuide -Connection $Connection -Method "Delete" -Uri "/api/v1/guides/{0}" -Id $Id
    }
    end {}
}