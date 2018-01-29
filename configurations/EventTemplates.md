Page navigation

* [Get worksite event templates](#EventTemplates)
* [Get event template info](#EventTemplate)
* [Create event template](#new-EventTemplate)
* [Update event template](#edit-EventTemplate)
* [Delete event template](#delete-EventTemplate)

---

# <a name="EventTemplates">Get-IqsEventTemplates</a>
   
### Description

Gets a page with templates that satisfy specified criteria
    
### Syntax

    Get-IqsEventTemplates [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
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
    
    C:\PS>Get-IqsEventTemplates -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Filter @{ severity=50 } -Take 10

---

# <a name="EventTemplate">Get-IqsEventTemplate</a>

### Description

Gets template by its unique id
    
### Syntax

    Get-IqsEventTemplate [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Id < String >

    A object id. Required parameter. Can be retrieved from Get-IqsEventTemplates

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site user or higher roles.    

### Example
    
    C:\PS>Get-IqsEventTemplate -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="new-EventTemplate">New-IqsEventTemplate</a>

### Description

Creates a new event template.
    
### Syntax

    New-IqsEventTemplate [-Connection < Hashtable >] [-SiteId] < String > [-Template] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Template < Object >

    Required parameter. A template with the following structure:

        - id: string
        - site_id: string
        - severity: number
        - description: string
        - set_time: boolean
        - set_object: boolean
        - set_pos: boolean

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>New-IqsEventTemplate -SiteId 1 -Template @{ site_id="1"; severity=500; description="Test event" }

---

# <a name="edit-EventTemplate">Update-IqsEventTemplate</a>
 
### Description

Updates existing event template
    
### Syntax

    Update-IqsEventTemplate [-Connection < Hashtable >] [-SiteId] < String > [-Template] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Template < Object >

    Required parameter. A object with the following structure:

        - id: string
        - site_id: string
        - severity: number
        - description: string
        - set_time: boolean
        - set_object: boolean
        - set_pos: boolean

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Update-IqsEventTemplate -SiteId 1 -Template @{ site_id="1"; severity=500; description="Test event" }

---

# <a name="delete-EventTemplate">Remove-IqsEventTemplate</a>
    
### Description

Removes event template by its unique id
    
### Syntax

    Remove-IqsEventTemplate [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Id < String >

    A template id. Required parameter. Can be retrieved from Get-IqsEventTemplates

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Remove-IqsEventTemplate -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2