Page navigation

* [Get worksite zones](#zones)
* [Get zone info](#zone)
* [Create zone](#new-zone)
* [Update zone](#edit-zone)
* [Delete zone](#delete-zone)

---

# <a name="zones">Get-IqpZones</a>
   
### Description

Gets a page with zones that satisfy specified criteria
    
### Syntax

    Get-IqpZones [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
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
    
    C:\PS>Get-IqpZones -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Filter @{ type="object" } -Take 10

---

# <a name="zone">Get-IqpZone</a>

### Description

Gets zone by its unique id
    
### Syntax

    Get-IqpZone [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Id < String >

    A zone id. Required parameter. Can be retrieved from Get-IqpZones

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site user or higher roles.    

### Example
    
    C:\PS>Get-IqpZone -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="new-zone">New-IqpZone</a>

### Description

Creates new zone
    
### Syntax

    New-IqpZone [-Connection < Hashtable >] [-SiteId] < String > [-Zone] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Zone < Object >

    Required parameter. A zone with the following structure:
    
        - id: string
        - site_id: string
        - type: string
        - name: string
        - center: any
        - distance: number
        - geometry: any
        - include_object_ids: string[]
        - include_group_ids: string[]
        - exclude_object_ids: string[]
        - exclude_group_ids: string[]

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>New-IqpZone -SiteId 1 -Zone @{ site_id="1"; type="circle"; name="Parking"; center=@{ type="Point"; coordinates=@(32, -110) }; distance=300 }

---

# <a name="edit-zone">Update-IqpZone</a>
 
### Description

Updates existing zone
    
### Syntax

    Update-IqpZone [-Connection < Hashtable >] [-SiteId] < String > [-Zone] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Zone < Object >

    Required parameter. A zone with the following structure:
    
        - id: string
        - site_id: string
        - type: string
        - name: string
        - center: any
        - distance: number
        - geometry: any
        - include_object_ids: string[]
        - include_group_ids: string[]
        - exclude_object_ids: string[]
        - exclude_group_ids: string[]

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>New-IqpZone -SiteId 1 -Zone @{ site_id="1"; type="circle"; name="Parking"; center=@{ type="Point"; coordinates=@(32, -110) }; distance=300 }

---

# <a name="delete-zone">Remove-IqpZone</a>
    
### Description

Removes zone by its unique id
    
### Syntax

    Remove-IqpZone [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Id < String >

    A zone id. Required parameter. Can be retrieved from Get-IqpZones

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Remove-IqpZone -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2