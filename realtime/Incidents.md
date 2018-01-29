Page navigation

* [Get worksite incidents](#incidents)
* [Get incident info](#incident)
* [Create incident](#new-incident)
* [Close incident](#close-incident)
* [Delete incident](#delete-incident)

---

# <a name="incidents">Get-IqsIncidents</a>
   
### Description

Gets a page with incidents that satisfy specified criteria
    
### Syntax

    Get-IqsIncidents [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Filter < Hashtable >

    A filter with search criteria (default: no filter)
        
- Skip < Int32 >

    A number of records to skip (default: 0)
        
- Take < Int32 >

    A number of records to return (default: 100)
        
- Total < Boolean >

    A include total count (default: false)
        
- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site user or higher roles.

### Example
    
    C:\PS>Get-IqsIncidents -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Filter @{ object_id="85e52f3abf2e4091b489dc4f01df2df2" } -Take 10

---

# <a name="incident">Get-IqsIncident</a>

### Description

Gets incident by its unique id
    
### Syntax

    Get-IqsIncident [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Id < String >

    A incident id. Required parameter. Can be retrieved from Get-IqsIncidents

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site user or higher roles.    

### Example
    
    C:\PS>Get-IqsIncident -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="new-incident">New-IqsIncident</a>

### Description

Creates new incident
    
### Syntax

    New-IqsIncident [-Connection < Hashtable >] [-SiteId] < String > [-Incident] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Incident < Object >

    Required parameter. A incident with the following structure:
    
        - id: string
        - site_id: string
        - event_id: string
        - rule_id: string
        - severity: number
        - time: Date
        - pos: any
        - group_id: string
        - object_id: string
        - loc_id: string
        - zone_id: string
        - resolution: string
        - resolution_id: string
        - description: string
        - expected_value: any
        - actual_value: any
        - value_units: string

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site admin or higher roles.

### Example
    
    C:\PS>New-IqsIncident -SiteId 1 -Incident @{ site_id="1"; rule_id="123"; event_id="234"; description="Test incident"; severity=50 }

---

# <a name="close-incident">Close-IqsIncident</a>
 
### Description

Closes existing incident
    
### Syntax

    Close-IqsIncident [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [-ResolutionId] < String > [-Resolution] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites

-Id <String>
    
    A incident id
        
-ResolutionId <String>
    
    A unique incident resolution
        
-Resolution <String>
    
    A incident resolution

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Close-IqsIncident -SiteId 1 -Id 123 -Resolution "Test completed" -ResolutionId "1"

---

# <a name="delete-incident">Remove-IqsIncident</a>
    
### Description

Removes incident by its unique id
    
### Syntax

    Remove-IqsIncident [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Id < String >

    A incident id. Required parameter. Can be retrieved from Get-IqsIncidents

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Remove-IqsIncident -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2