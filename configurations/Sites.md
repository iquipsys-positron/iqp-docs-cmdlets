Page navigation

* [Get worksite sites](#sites)
* [Get site info](#site)
* [Create site](#new-site)
* [Update site](#edit-site)
* [Delete site](#delete-site)
* [Get site users](#site-users)

---

# <a name="sites">Get-IqtSites</a>
   
### Description

Gets a page with sites that satisfy specified criteria
    
### Syntax

    Get-IqtSites [-Connection < Hashtable >] [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
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

Any signed user can execute this cmdlet.

### Example
    
    C:\PS>Get-IqtSites -Take 10

---

# <a name="site">Get-IqtSite</a>

### Description

Gets site by its unique id
    
### Syntax

    Get-IqtSite [-Connection < Hashtable >] [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- Id < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site user or higher roles.    

### Example
    
    C:\PS>Get-IqtSite -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="new-site">New-IqtSite</a>

### Description

Creates new site
    
### Syntax

    New-IqtSite [-Connection < Hashtable >] [-Site] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- Site < Object >

    Required parameter. A site with the following structure:
    
        - id: string
        - code: string
        - active: boolean
        - name: string
        - description: string
        - address: string
        - center: any - GeoJSON
        - radius?: number - In km
        - geometry: any - GeoJSON
        - map_id: string - Blob id with map background
        - map_north: number
        - map_south: number
        - map_west: number
        - map_east: number

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

Any signed user can execute this cmdlet.

### Example
    
    C:\PS>New-IqtSite -Site @{ code="COOL123"; name="Cool mine"; active=$true }

---

# <a name="edit-site">Update-IqtSite</a>
 
### Description

Updates existing site
    
### Syntax

    Update-IqtSite [-Connection < Hashtable >] [-Site] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- Site < Object >

    Required parameter. A site with the following structure:
    
        - id: string
        - code: string
        - active: boolean
        - name: string
        - description: string
        - address: string
        - center: any - GeoJSON
        - radius?: number - In km
        - geometry: any - GeoJSON
        - map_id: string - Blob id with map background
        - map_north: number
        - map_south: number
        - map_west: number
        - map_east: number

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site admin or higher roles.

### Example
    
    C:\PS>Update-IqtSite -Site @{ code="COOL123"; name="Cool mine"; active=$true }

---

# <a name="delete-site">Remove-IqtSite</a>
    
### Description

Deletes existing site
    
### Syntax

    Remove-IqtSite [-Connection < Hashtable >] [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- Id < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site admin or higher roles.

### Example
    
    C:\PS>Remove-IqtSite -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="site-users">Get-IqtSiteUsers</a>

### Description

Gets a page with site users by site id
    
### Syntax

    Get-IqtSite [-Connection < Hashtable >] [-Id] < String > [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- Id < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites

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
    
    C:\PS>Get-IqtSite -Id 85e52f3abf2e4091b489dc4f01df2df2