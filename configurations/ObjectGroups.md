Page navigation

* [Get worksite object groups](#ObjectGroups)
* [Get object group info](#ObjectGroup)
* [Create object group](#new-ObjectGroup)
* [Update object group](#edit-ObjectGroup)
* [Delete object group](#delete-ObjectGroup)

---

# <a name="ObjectGroups">Get-IqpObjectGroups</a>
   
### Description

Gets a page with groups that satisfy specified criteria
    
### Syntax

    Get-IqpObjectGroups [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
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
    
    C:\PS>Get-IqpObjectGroups -SiteId 1 -Filter @{ name="trucks" } -Take 10

---

# <a name="ObjectGroup">Get-IqpObjectGroup</a>

### Description

Gets group by its unique id
    
### Syntax

    Get-IqpObjectGroup [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Id < String >

    A group id. Required parameter. Can be retrieved from Get-IqpObjectGroups

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site user or higher roles.    

### Example
    
    C:\PS>Get-IqpObjectGroup -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="new-ObjectGroup">New-IqpObjectGroup</a>

### Description

Creates a new group.
    
### Syntax

    New-IqpObjectGroup [-Connection < Hashtable >] [-SiteId] < String > [-Group] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Group < Object >

    Required parameter. A ObjectGroup with the following structure:
    
        - id: string
        - site_id: string
        - name: string
        - object_ids: string[]

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>New-IqpObjectGroup -SiteId 1 -Group @{ site_id="1"; name="Pickups"; object_ids=@("1", "2") }

---

# <a name="edit-ObjectGroup">Update-IqpObjectGroup</a>
 
### Description

Updates existing group.
    
### Syntax

    Update-IqpObjectGroup [-Connection < Hashtable >] [-SiteId] < String > [-Group] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Group < Object >

    Required parameter. A ObjectGroup with the following structure:
    
        - id: string
        - site_id: string
        - name: string
        - object_ids: string[]

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Update-IqpObjectGroup -SiteId 1 -Group @{ site_id="1"; name="Pickups"; object_ids=@("1", "2") }

---

# <a name="delete-ObjectGroup">Remove-IqpObjectGroup</a>
    
### Description

Deletes existing group
    
### Syntax

    Remove-IqpObjectGroup [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Id < String >

    A group id. Required parameter. Can be retrieved from Get-IqpObjectGroups

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Remove-IqpObjectGroup -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2