Page navigation

* [Get worksite operational events](#OperationalEvents)
* [Create operational events](#new-OperationalEvent)
* [Delete operational events](#delete-OperationalEvents)

---

# <a name="OperationalEvents">Get-IqsOperationalEvents</a>
   
### Description

Gets a page with Events that satisfy specified criteria
    
### Syntax

    Get-IqsOperationalEvents [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
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
    
    C:\PS>Get-IqsOperationalEvents -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Filter @{ description="critical alarm" } -Take 10

---

# <a name="new-OperationalEvent">New-IqsOperationalEvent</a>

### Description

Creates a new event.
    
### Syntax

    New-IqsOperationalEvent [-Connection < Hashtable >] [-SiteId] < String > [-Event] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Event < Object >

    Required parameter. A Event with the following structure:
    
        - id: string
        - site_id: string
        - create_time: Date
        - creator_id: string
        - type: string
        - rule_id: string
        - severity: number
        - time: Date
        - pos: any
        - group_id: string
        - object_id: string
        - loc_id: string
        - zone_id: string
        - ref_event_id: string
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

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>New-IqsOperationalEvent -SiteId 1 -Event @{ site_id="1"; type="manual"; severity=500; description="Test event" }

---

# <a name="delete-OperationalEvent">Remove-IqsOperationalEvent</a>
    
### Description

Removes Events that match specified filter
    
### Syntax

    Remove-IqsOperationalEvent [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Id < String >

    An event id. Required parameter. Can be retrieved from Get-IqsOperationalEvents

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site admin or higher roles.

### Example
    
   C:\PS>Remove-IqsOperationalEvent -SiteId 1 -Filter @{ object_id="123" }