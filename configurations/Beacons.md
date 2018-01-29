Page navigation

* [Get worksite beacons](#beacons)
* [Get beacon info](#beacon)
* [Calculate object position by beacons](#find-position)
* [Create beacon](#new-beacon)
* [Update beacon](#edit-beacon)
* [Delete beacon](#delete-beacon)

---

# <a name="beacons">Get-IqsBeacons</a>
    
### Description

Gets page with beacons by specified criteria
    
### Syntax

    Get-IqsBeacons [-Connection< Hashtable >] [-SiteId] < String > [[-Filter]< Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
       
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
    
    C:\PS>Get-IqsBeacons -SiteId 1 -Take 10
    
---

# <a name="beacon">Get-IqsBeacon</a>
    
### Description

Gets beacon by id
    
### Syntax

    Get-IqsBeacon [-Connection< Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
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
    
    C:\PS>Get-IqsBeacon -SiteId 1 -Id 123

---

# <a name="find-position">Find-IqsPositionByBeacon</a>
    
### Description

Calculate position by beacon udis
    
    
### Syntax

    Find-IqsPositionByBeacon [-Connection< Hashtable >] [-SiteId] < String > [-BeaconUdi] <String[]> [< CommonParameters >]
    
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
    
    C:\PS>Find-IqsPositionByBeacon -SiteId 1 -BeaconUdi 00000123, 00000124

---

# <a name="new-beacon">New-IqsBeacon</a>
    
### Description

Creates a new beacon
    
### Syntax

    New-IqsBeacon [-Connection< Hashtable >] [-SiteId] < String > [-Beacon] < Object > [< CommonParameters >]
    
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
    
    C:\PS>New-IqsBeacon -SiteId 1 -Beacon @{ site_id="1"; udi="0000123"; label="Parking"; center=@{ type="Point"; coordinates=@(32, -110) }; radius=50 }
    
---

# <a name="edit-beacon">Update-IqsBeacon</a>
    
### Description

Updates a new beacon
    
### Syntax

    Update-IqsBeacon [-Connection< Hashtable >] [-SiteId] < String > [-Beacon] < Object > [< CommonParameters >]
    
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
    
    C:\PS>Update-IqsBeacon -SiteId 1 -Beacon @{ site_id="1"; udi="0000123"; label="Parking"; center=@{ type="Point"; coordinates=@(32, -110) }; radius=50 }
    
---

# <a name="delete-beacon">Remove-IqsBeacon</a>
    
### Description

Removes beacon by id
    
    
### Syntax
    Remove-IqsBeacon [-Connection< Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]

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
    
    C:\PS>Remove-IqsBeacon -SiteId 1 -Id 123