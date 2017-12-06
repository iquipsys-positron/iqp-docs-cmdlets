########################################################
##
## Feedbacks.ps1
## Management interface to IQuipsys tracker
## User feedbacks commands
##
#######################################################


function Get-IqtFeedbacks
{
<#
.SYNOPSIS

Gets page with feedbacks by specified criteria

.DESCRIPTION

Gets a page with feedbacks that satisfy specified criteria

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

Get-IqtFeedbacks -Filter @{ tags="goals,success" } -Take 10

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
        Get-PipFeedbacks -Connection $Connection -Method "Get" -Uri "/api/v1/feedbacks" -Filter $Filter -Skip $Skip -Take $Take -Total $Total
    }
    end {}
}


function Get-IqtFeedback
{
<#
.SYNOPSIS

Gets feedback by id

.DESCRIPTION

Gets feedback by its unique id

.PARAMETER Connection

A connection object

.PARAMETER Id

A feedback id

.EXAMPLE

Get-IqtFeedback -Id 123

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
        Get-PipFeedback -Connection $Connection -Method "Get" -Uri "/api/v1/feedbacks/{0}" -Id $Id
    }
    end {}
}


function Send-IqtFeedback
{
<#
.SYNOPSIS

Sends a new feedback

.DESCRIPTION

Sends a new feedback

.PARAMETER Connection

A connection object

.PARAMETER Feedback

A feedback with the following structure:
- id: string
- category: string
- app: string
- title: string
- content: string
- pics: AttachmentV1
  - id: string
  - uri: string
- docs: AttachmentV1[]
  - id: string
  - uri: string
  - name: string
- company_name: string
- company_addr: string
- copyright_holder: string
- original_loc: string
- copyrighted_work: string
- unauth_loc: string
- custom_hdr: any
- custom_dat: any

.EXAMPLE

Send-IqtFeedback -Feedback @{ category="feature request"; app="myapp"; title="I propose an idea"; content="Add somethign cool to your product" }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Feedback
    )
    begin {}
    process 
    {
        Send-PipFeedback -Connection $Connection -Method "Post" -Uri "/api/v1/feedbacks" -Feedback $Feedback
    }
    end {}
}


function Resolve-IqtFeedback
{
<#
.SYNOPSIS

Resolves feedback

.DESCRIPTION

Resoles feedback

.PARAMETER Connection

A connection object

.PARAMETER Id

A feedback id

.PARAMETER Reply

A rely text

.EXAMPLE

Resolve-IqtFeedback -Id 123 -Reply "Thanks for your feedback and see you later!"

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string] $Id,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipelineByPropertyName=$true)]
        [string] $Reply
    )
    begin {}
    process 
    {
        Resolve-PipFeedback -Connection $Connection -Method "Put" -Uri "/api/v1/feedbacks/{0}" -Id $Id -Reply $Reply
    }
    end {}
}


function Remove-IqtFeedback
{
<#
.SYNOPSIS

Removes feedback by id

.DESCRIPTION

Removes feedback by its unique id

.PARAMETER Connection

A connection object

.PARAMETER Id

A feedback id

.EXAMPLE

Remove-IqtFeedback -Id 123

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
        Remove-PipFeedback -Connection $Connection -Method "Delete" -Uri "/api/v1/feedbacks/{0}" -Id $Id
    }
    end {}
}