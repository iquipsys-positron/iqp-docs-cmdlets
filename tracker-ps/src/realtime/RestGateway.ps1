########################################################
##
## RestGateway.ps1
## Management interface to IQuipsys tracker
## REST gateway commands
##
#######################################################

function Send-IqtStatusUpdate
{
<#
.SYNOPSIS

Sends status update message

.DESCRIPTION

Sends device status update through REST gateway. The device shall be registered at least for one site

.PARAMETER Connection

A connection object

.PARAMETER Message

A status update message

.EXAMPLE

Send-IqtStatusUpdate -Message @{ device_udi="+15202250000"; lat=32.01; long=-110.22; alt=720; angle=45; speed=30; quality=2; pressed=false }

#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$true)]
        [Hashtable] $Connection,
        [Parameter(Mandatory=$true, Position = 0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Object] $Message
    )
    begin {}
    process 
    {
        $route = "/api/v1/gateway/update_status"

        $null = Invoke-PipFacade -Connection $Connection -Method "POST" -Route $route -Request $Message
    }
    end {}
}
