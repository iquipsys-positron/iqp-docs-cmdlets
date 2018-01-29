Page navigation

* [Get worksite object positions](#ObjectPositions)
* [Add object positions](#new-ObjectPosition)
* [Add multiple object positions](#new-ObjectPositions)
* [Delete object positions](#delete-ObjectPositions)

---

# <a name="ObjectPositions">Get-IqsObjectPositions</a>
   
### Description

Gets a page with positions that satisfy specified criteria
    
### Syntax

    Get-IqsObjectPositions [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
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
    
    C:\PS>Get-IqsObjectPositions -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Filter @{ object_id="123" } -Take 10

---

# <a name="new-ObjectPosition">Add-IqsObjectPosition</a>

### Description

Adds position to object positions
    
### Syntax

    Add-IqsObjectPosition [-Connection < Hashtable >] [-SiteId] < String > [-Position] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Position < Object >

    Required parameter. A position with the following structure:
    
        - site_id: string
        - object_id: string
        - time: Date
        - lat: number
        - long: number

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site admin or higher roles.

### Example
    
    C:\PS>Add-IqsObjectPosition -SiteId 1 -Position @{ site_id="1"; object_id="123"; lat=1; long=1 }

---

# <a name="new-ObjectPositions">Add-IqsObjectPositions</a>

### Description

Adds multiple object positions
    
### Syntax

    Add-IqsObjectPositions [-Connection < Hashtable >] [-SiteId] < String > [-Position] < Object[] > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Position < Object[] >

    Required parameter. An array of positions with the following structure:
    
        - site_id: string
        - object_id: string
        - time: Date
        - lat: number
        - long: number

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site admin or higher roles.

### Example
    
    C:\PS>Add-IqsObjectPositions -SiteId 1 -Positions @( @{ site_id="1"; object_id="123"; lat=1; long=1 }, ... )

---

# <a name="delete-ObjectPositions">Remove-IqsObjectPositions</a>
    
### Description

Removes positions that match specified filter
    
### Syntax

    Remove-IqsObjectPosition [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
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
    
   C:\PS>Remove-IqsObjectPositions -SiteId 1 -Filter @{ object_id="123" }