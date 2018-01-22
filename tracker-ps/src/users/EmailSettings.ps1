########################################################
##
## EmailSettings.ps1
## Management interface to IQuipsys tracker
## Email settings commands
##
#######################################################

function Get-IqpEmailSettings
{
<#
.SYNOPSIS

Get user email settings

.DESCRIPTION

Gets all users email settings by its id

.PARAMETER Connection

A connection object

.PARAMETER Id

A unique user id

.EXAMPLE

Get-IqpEmailSettings -Id 123

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
        Get-PipEmailSettings -Connection $Connection -Method "Get" -Uri "/api/v1/email_settings/{0}" -Id $Id
    }
    end {}
}


function Set-IqpEmailSettings
{
<#
.SYNOPSIS

Set user email settings

.DESCRIPTION

Sets all users email settings defined by its id

.PARAMETER Connection

A connection object

.PARAMETER Settings

An user email settings with the following structure
- id: string
- name: string
- email: string
- language: string
- subscriptions: any
- custom_hdr: any
- custom_dat: any

.EXAMPLE

Set-IqpEmailSettings -Settings @{ id="123"; name="Test user"; email="test@somewhere.com"; language="en" }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Settings
    )
    begin {}
    process 
    {
        Set-PipEmailSettings -Connection $Connection -Method "Put" -Uri "/api/v1/email_settings/{0}" -Settings $Settings
    }
    end {}
}


function Request-IqpEmailVerification
{
<#
.SYNOPSIS

Requests email verification message

.DESCRIPTION

Requests a email verification message by user login

.PARAMETER Connection

A connection object

.PARAMETER Login

User login

.EXAMPLE

Request-IqpEmailVerification -Login test@somewhere.com

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string] $Login
    )
    begin {}
    process 
    {
        Request-PipEmailVerification -Connection $Connection -Method "Post" -Uri "/api/v1/email_settings/resend" -Login $Login
    }
    end {}
}


function Submit-IqpEmailVerification
{
<#
.SYNOPSIS

Verifies user email address

.DESCRIPTION

Verifies user email address using reset code sent by email

.PARAMETER Connection

A connection object

.PARAMETER Login

User login

.PARAMETER Code

Reset code

.EXAMPLE

Submit-IqpEmailVerification -Login test@somewhere.com -Code 1245

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [string] $Login,
        [Parameter(Mandatory=$true, Position = 1, ValueFromPipelineByPropertyName=$true)]
        [string] $Code
    )
    begin {}
    process 
    {
        Submit-PipEmailVerification -Connection $Connection -Method "Post" -Uri "/api/v1/email_settings/verify" -Login $Login -Code $Code
    }
    end {}
}