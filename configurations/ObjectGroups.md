Page navigation

* [Get worksite object groups](#ObjectGroups)
* [Get object group info](#ObjectGroup)
* [Create object group](#new-ObjectGroup)
* [Update object group](#edit-ObjectGroup)
* [Delete object group](#delete-ObjectGroup)

---

# <a name="ObjectGroups">Get-IqtObjectGroups</a>
   
### Description

Gets a page with groups that satisfy specified criteria
    
### Syntax

    Get-IqtObjectGroups [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
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
        
- Total < < Boolean > >

    A include total count (default: false)
        
- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site user or higher roles.

### Example
    
    C:\PS>Get-IqtObjectGroups -SiteId 1 -Filter @{ name="trucks" } -Take 10

---

# <a name="ObjectGroup">Get-IqtObjectGroup</a>

### Description

Gets group by its unique id
    
### Syntax

    Get-IqtObjectGroup [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites
        
- Id < String >

    A group id. Required parameter. Can be retrieved from Get-IqtObjectGroups

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site user or higher roles.    

### Example
    
    C:\PS>Get-IqtObjectGroup -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="new-ObjectGroup">New-IqtObjectGroup</a>

### Description

Creates a new group.
    
### Syntax

    New-IqtObjectGroup [-Connection < Hashtable >] [-SiteId] < String > [-Group] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites
        
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
    
    C:\PS>New-IqtObjectGroup -SiteId 1 -Group @{ site_id="1"; name="Pickups"; object_ids=@("1", "2") }

---

# <a name="edit-ObjectGroup">Update-IqtObjectGroup</a>
 
### Description

Updates existing group.
    
### Syntax

    Update-IqtObjectGroup [-Connection < Hashtable >] [-SiteId] < String > [-Group] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites
        
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
    
    C:\PS>Update-IqtObjectGroup -SiteId 1 -Group @{ site_id="1"; name="Pickups"; object_ids=@("1", "2") }

---

# <a name="delete-ObjectGroup">Remove-IqtObjectGroup</a>
    
### Description

Deletes existing group
    
### Syntax

    Remove-IqtObjectGroup [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites
        
- Id < String >

    A group id. Required parameter. Can be retrieved from Get-IqtObjectGroups

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Remove-IqtObjectGroup -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2