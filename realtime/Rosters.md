Page navigation

* [Get worksite rosters](#rosters)
* [Get roster info](#roster)
* [Create roster](#new-roster)
* [Update roster](#edit-roster)
* [Delete roster](#delete-roster)

---

# <a name="rosters">Get-IqpRosters</a>
   
### Description

Gets a page with rosters that satisfy specified criteria
    
### Syntax

    Get-IqpRosters [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
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
    
    C:\PS>Get-IqpRosters -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Filter @{ shift_id="85e52f3abf2e4091b489dc4f01df2df2" } -Take 10

---

# <a name="roster">Get-IqpRoster</a>

### Description

Gets roster by its unique id
    
### Syntax

    Get-IqpRoster [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Id < String >

    A roster id. Required parameter. Can be retrieved from Get-IqpRosters

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site user or higher roles.    

### Example
    
    C:\PS>Get-IqpRoster -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="new-roster">New-IqpRoster</a>

### Description

Creates new roster
    
### Syntax

    New-IqpRoster [-Connection < Hashtable >] [-SiteId] < String > [-Roster] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
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
    
    C:\PS>New-IqpRoster -SiteId 1 -Roster @{ site_id="1"; name="Entire day"; start_date=@(Get-Date) }

---

# <a name="edit-roster">Update-IqpRoster</a>
 
### Description

Updates existing roster
    
### Syntax

    Update-IqpRoster [-Connection < Hashtable >] [-SiteId] < String > [-Roster] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
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
    
    C:\PS>Update-IqpRoster -SiteId 1 -Roster  @{ site_id="1"; name="Entire day"; start_date=@(Get-Date) }

---

# <a name="delete-roster">Remove-IqpRoster</a>
    
### Description

Deletes existing roster
    
### Syntax

    Remove-IqpRoster [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Id < String >

    A roster id. Required parameter. Can be retrieved from Get-IqpRosters

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Remove-IqpRoster -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2