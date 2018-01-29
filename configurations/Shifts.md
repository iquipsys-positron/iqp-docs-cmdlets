Page navigation

* [Get worksite shifts](#shifts)
* [Get shift info](#shift)
* [Create shift](#new-shift)
* [Update shift](#edit-shift)
* [Delete shift](#delete-shift)

---

# <a name="shifts">Get-IqsShifts</a>
   
### Description

Gets a page with shifts that satisfy specified criteria
    
### Syntax

    Get-IqsShifts [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
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
    
    C:\PS>Get-IqsShifts -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba

---

# <a name="shift">Get-IqsShift</a>

### Description

Gets shift by its unique id
    
### Syntax

    Get-IqsShift [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Id < String >

    A shift id. Required parameter. Can be retrieved from Get-IqsShifts

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site user or higher roles.    

### Example
    
    C:\PS>Get-IqsShift -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="new-shift">New-IqsShift</a>

### Description

Creates new shift
    
### Syntax

    New-IqsShift [-Connection < Hashtable >] [-SiteId] < String > [-shift] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- shift < Object >

    Required parameter. A shift with the following structure:
    
        - id: string
        - site_id: string
        - name: string
        - start: number
        - duration: number

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>New-IqsShift -SiteId 1 -Shift @{ site_id="1"; name="Night shift"; start=0; duration=480 }

---

# <a name="edit-shift">Update-IqsShift</a>
 
### Description

Updates existing shift
    
### Syntax

    Update-IqsShift [-Connection < Hashtable >] [-SiteId] < String > [-shift] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- shift < Object >

    Required parameter. A shift with the following structure:
    
        - id: string
        - site_id: string
        - name: string
        - start: number
        - duration: number

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Update-IqsShift -SiteId 1 -Shift @{ site_id="1"; name="Night shift"; start=0; duration=480 }

---

# <a name="delete-shift">Remove-IqsShift</a>
    
### Description

Deletes existing shift
    
### Syntax

    Remove-IqsShift [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Id < String >

    A shift id. Required parameter. Can be retrieved from Get-IqsShifts

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Remove-IqsShift -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2