Page navigation

* [Get worksite control objects](#ControlObjects)
* [Get control object info](#ControlObject)
* [Create control object](#new-ControlObject)
* [Update control object](#edit-ControlObject)
* [Delete control object](#delete-ControlObject)

---

# <a name="ControlObjects">Get-IqsControlObjects</a>
   
### Description

Gets a page with objects that satisfy specified criteria
    
### Syntax

    Get-IqsControlObjects [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
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
    
    C:\PS>Get-IqsControlObjects -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba

---

# <a name="ControlObject">Get-IqsControlObject</a>

### Description

Gets object by its unique id
    
### Syntax

    Get-IqsControlObject [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Id < String >

    A object id. Required parameter. Can be retrieved from Get-IqsControlObjects

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 
To execute this cmdlet needed site user or higher roles.    

### Example
    
    C:\PS>Get-IqsControlObject -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="new-ControlObject">New-IqsControlObject</a>

### Description

Creates a new object.
    
### Syntax

    New-IqsControlObject [-Connection < Hashtable >] [-SiteId] < String > [-Object] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Object < Object >

    Required parameter. A object with the following structure:

        - id: string
        - site_id: string
        - category: string
        - type: string
        - deleted: boolean
        - name: string
        - description: string
        - phone: string
        - pin: string
        - device_id: string
        - group_ids: string[]

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>New-IqsControlObject -SiteId 1 -Object @{ site_id="1"; category="equipment"; type="haul"; name="T101"; group_ids=@("1", "2") }

---

# <a name="edit-ControlObject">Update-IqsControlObject</a>
 
### Description

Updates existing control object
    
### Syntax

    Update-IqsControlObject [-Connection < Hashtable >] [-SiteId] < String > [-Object] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- ControlObject < Object >

    Required parameter. A object with the following structure:

        - id: string
        - site_id: string
        - category: string
        - type: string
        - deleted: boolean
        - name: string
        - description: string
        - phone: string
        - pin: string
        - device_id: string
        - group_ids: string[]


- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 
To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Update-IqsControlObject -SiteId 1 -Object @{ site_id="1"; category="equipment"; type="haul"; name="T101"; group_ids=@("1", "2") }

---

# <a name="delete-ControlObject">Remove-IqsControlObject</a>
    
### Description

Removes object by its unique id
    
### Syntax

    Remove-IqsControlObject [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Id < String >

    A object id. Required parameter. Can be retrieved from Get-IqsControlObjects

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 
To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Remove-IqsControlObject -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2