Page navigation

* [Get worksite object states](#ObjectStates)
* [Add object states](#new-ObjectState)
* [Add multiple object states](#new-ObjectStates)
* [Delete object states](#delete-ObjectStates)

---

# <a name="ObjectStates">Get-IqtObjectStates</a>
   
### Description

Gets a page with states that satisfy specified criteria
    
### Syntax

    Get-IqtObjectStates [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [[-Time] < DateTime >] [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites
        
- Filter < Hashtable >

    A filter with search criteria (default: no filter)
        
- Skip < Int32 >

    A number of records to skip (default: 0)
        
- Take < Int32 >

    A number of records to return (default: 100)
        
- Total < Boolean >

    A include total count (default: false)

- Time < DateTime >

    A specified timeline to retrieve states
        
- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site user or higher roles.

### Example
    
    C:\PS>Get-IqtObjectStates -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Filter @{ object_id="123" } -Take 10

---

# <a name="new-ObjectState">Add-IqtObjectState</a>

### Description

Adds state to object states
    
### Syntax

    Add-IqtObjectState [-Connection < Hashtable >] [-SiteId] < String > [-State] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites
        
- State < Object >

    Required parameter. A state with the following structure:
    
        - site_id: string
        - device_id: string
        - immobile: boolean
        - emergency: boolean
        - time: Date
        - lat: number
        - long: number
        - alt: number
        - angle: number
        - speed: number
        - online: number
        - immobile: number
        - emergency: number

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site admin or higher roles.

### Example
    
    C:\PS>Add-IqtObjectState -SiteId 1 -State @{ site_id="1"; device_id="1"; object_id="123"; time=$(Get-Date) lat=1; long=1; online=10; immobile=0; emergency=0 }

---

# <a name="new-ObjectStates">Add-IqtObjectStates</a>

### Description

Adds multiple states to object state
    
### Syntax

    Add-IqtObjectStates [-Connection < Hashtable >] [-SiteId] < String > [-State] < Object[] > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites
        
- State < Object[] >

    Required parameter. An array of states with the following structure:
    
        - site_id: string
        - device_id: string
        - immobile: boolean
        - emergency: boolean
        - time: Date
        - lat: number
        - long: number
        - alt: number
        - angle: number
        - speed: number
        - online: number
        - immobile: number
        - emergency: number

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site admin or higher roles.

### Example
    
    C:\PS>Add-IqtObjectStates -SiteId 1 -States @( @{ site_id="1"; device_id="1"; object_id="123"; time=$(Get-Date) lat=1; long=1; online=10; immobile=0; emergency=0 }, ... )

---

# <a name="delete-ObjectStates">Remove-IqtObjectStates</a>
    
### Description

Removes states that match specified filter
    
### Syntax

    Remove-IqtObjectState [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites
        
- Filter < Hashtable >

    A filter with search criteria (default: no filter)

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site admin or higher roles.

### Example
    
   C:\PS>Remove-IqtObjectStates -SiteId 1 -Filter @{ object_id="123" }