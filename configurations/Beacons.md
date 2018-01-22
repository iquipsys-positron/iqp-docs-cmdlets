Page navigation

* [Get worksite beacons](#beacons)
* [Get beacon info](#beacon)
* [Calculate object position by beacons](#find-position)
* [Create beacon](#new-beacon)
* [Update beacon](#edit-beacon)
* [Delete beacon](#delete-beacon)

---

# <a name="beacons">Get-IqpBeacons</a>
    
### Description

Gets page with beacons by specified criteria
    
### Syntax

    Get-IqpBeacons [-Connection< Hashtable >] [-SiteId] < String > [[-Filter]< Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
       
### Parameters

- Connection< Hashtable >

    A connection object
        
- SiteId < String >

    A site id
        
- Filter< Hashtable >

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
    
    C:\PS>Get-IqpBeacons -SiteId 1 -Take 10
    
---

# <a name="beacon">Get-IqpBeacon</a>
    
### Description

Gets beacon by id
    
### Syntax

    Get-IqpBeacon [-Connection< Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection< Hashtable >

    A connection object
        
- SiteId < String >

    A site id
        
- Id < String >

    A beacon id
        
- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 

### Access security 

To execute this cmdlet needed site user or higher roles.    

### Example
    
    C:\PS>Get-IqpBeacon -SiteId 1 -Id 123

---

# <a name="find-position">Find-IqpPositionByBeacon</a>
    
### Description

Calculate position by beacon udis
    
    
### Syntax

    Find-IqpPositionByBeacon [-Connection< Hashtable >] [-SiteId] < String > [-BeaconUdi] <String[]> [< CommonParameters >]
    
### Parameters

- Connection< Hashtable >

    A connection object
        
- SiteId < String >

    A site id
        
- BeaconUdi <String[]>

    Array of beacon udis
        
- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 

### Access security 

To execute this cmdlet needed site manager or higher roles.   

### Example
    
    C:\PS>Find-IqpPositionByBeacon -SiteId 1 -BeaconUdi 00000123, 00000124

---

# <a name="new-beacon">New-IqpBeacon</a>
    
### Description

Creates a new beacon
    
### Syntax

    New-IqpBeacon [-Connection< Hashtable >] [-SiteId] < String > [-Beacon] < Object > [< CommonParameters >]
    
### Parameters

- Connection< Hashtable >

    A connection object
        
- SiteId < String >

    A site id
        
- Beacon < Object >

    A beacon with the following structure:

        - id: string
        - site_id: string
        - udi: string
        - label: string
        - center: any
        - radius: number

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 

### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>New-IqpBeacon -SiteId 1 -Beacon @{ site_id="1"; udi="0000123"; label="Parking"; center=@{ type="Point"; coordinates=@(32, -110) }; radius=50 }
    
---

# <a name="edit-beacon">Update-IqpBeacon</a>
    
### Description

Updates a new beacon
    
### Syntax

    Update-IqpBeacon [-Connection< Hashtable >] [-SiteId] < String > [-Beacon] < Object > [< CommonParameters >]
    
### Parameters

- Connection< Hashtable >

    A connection object
        
- SiteId < String >

    A site id
        
- Beacon < Object >

    A beacon with the following structure:
    
        - id: string
        - site_id: string
        - udi: string
        - label: string
        - center: any
        - radius: number
        
- < CommonParameters >
    
    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 

### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Update-IqpBeacon -SiteId 1 -Beacon @{ site_id="1"; udi="0000123"; label="Parking"; center=@{ type="Point"; coordinates=@(32, -110) }; radius=50 }
    
---

# <a name="delete-beacon">Remove-IqpBeacon</a>
    
### Description

Removes beacon by id
    
    
### Syntax
    Remove-IqpBeacon [-Connection< Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]

### Parameters

- Connection< Hashtable >

    A connection object
        
- SiteId < String >

    A site id
        
- Id < String >

    A beacon id
        
- < CommonParameters >
    
    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 

### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Remove-IqpBeacon -SiteId 1 -Id 123