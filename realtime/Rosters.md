Page navigation

* [Get worksite rosters](#rosters)
* [Get roster info](#roster)
* [Create roster](#new-roster)
* [Update roster](#edit-roster)
* [Delete roster](#delete-roster)

---

# <a name="rosters">Get-IqtRosters</a>
   
### Description

Gets a page with rosters that satisfy specified criteria
    
### Syntax

    Get-IqtRosters [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
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
        
- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site user or higher roles.

### Example
    
    C:\PS>Get-IqtRosters -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Filter @{ shift_id="85e52f3abf2e4091b489dc4f01df2df2" } -Take 10

---

# <a name="roster">Get-IqtRoster</a>

### Description

Gets roster by its unique id
    
### Syntax

    Get-IqtRoster [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites
        
- Id < String >

    A roster id. Required parameter. Can be retrieved from Get-IqtRosters

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site user or higher roles.    

### Example
    
    C:\PS>Get-IqtRoster -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="new-roster">New-IqtRoster</a>

### Description

Creates new roster
    
### Syntax

    New-IqtRoster [-Connection < Hashtable >] [-SiteId] < String > [-Roster] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites
        
- Roster < Object >

    Required parameter. A roster with the following structure:
    
        - id: string
        - site_id: string
        - name: string
        - shift_id: string
        - start_date: Date
        - start_time: Date
        - end_time: Date
        - objects: RosterObjectV1[]
          - object_id: string
          - assign_id: string
          - planned: boolean
          - actual: boolean
          - start_time: Date
          - end_time: Date

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>New-IqtRoster -SiteId 1 -Roster @{ site_id="1"; name="Entire day"; start_date=@(Get-Date) }

---

# <a name="edit-roster">Update-IqtRoster</a>
 
### Description

Updates existing roster
    
### Syntax

    Update-IqtRoster [-Connection < Hashtable >] [-SiteId] < String > [-Roster] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites
        
- Roster < Object >

    Required parameter. A roster with the following structure:
    
        - id: string
        - site_id: string
        - name: string
        - shift_id: string
        - start_date: Date
        - start_time: Date
        - end_time: Date
        - objects: RosterObjectV1[]
          - object_id: string
          - assign_id: string
          - planned: boolean
          - actual: boolean
          - start_time: Date
          - end_time: Date

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Update-IqtRoster -SiteId 1 -Roster  @{ site_id="1"; name="Entire day"; start_date=@(Get-Date) }

---

# <a name="delete-roster">Remove-IqtRoster</a>
    
### Description

Deletes existing roster
    
### Syntax

    Remove-IqtRoster [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites
        
- Id < String >

    A roster id. Required parameter. Can be retrieved from Get-IqtRosters

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Remove-IqtRoster -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2