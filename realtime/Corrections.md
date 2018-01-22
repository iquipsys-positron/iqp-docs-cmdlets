Page navigation

* [Get worksite corrections](#corrections)
* [Get correction info](#correction)
* [Create correction](#new-correction)
* [Update correction](#edit-correction)
* [Delete correction](#delete-correction)

---

# <a name="corrections">Get-IqpCorrections</a>
   
### Description

Gets a page with corrections that satisfy specified criteria
    
### Syntax

    Get-IqpCorrections [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
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
    
    C:\PS>Get-IqpCorrections -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Filter @{ object_id="85e52f3abf2e4091b489dc4f01df2df2" } -Take 10

---

# <a name="correction">Get-IqpCorrection</a>

### Description

Gets correction by its unique id
    
### Syntax

    Get-IqpCorrection [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Id < String >

    A correction id. Required parameter. Can be retrieved from Get-IqpCorrections

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site user or higher roles.    

### Example
    
    C:\PS>Get-IqpCorrection -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="new-correction">New-IqpCorrection</a>

### Description

Creates new correction
    
### Syntax

    New-IqpCorrection [-Connection < Hashtable >] [-SiteId] < String > [-Correction] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Correction < Object >

    Required parameter. A correction with the following structure:
    
        - id: string
        - site_id: string
        - object_id: string
        - group_id: string
        - reason: string
        - status: string
        - changes: CorrectionChangeV1[]
          - param_name: string
          - rule_id: string
          - zone_id: string
          - value: number

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>New-IqpCorrection -SiteId 1 -Correction @{ site_id="1"; object_id="1"; status="Requested"; reason="Test"; changes=@( @{ param_name="distance"; value=10 } ) }

---

# <a name="edit-correction">Update-IqpCorrection</a>
 
### Description

Updates existing correction
    
### Syntax

    Update-IqpCorrection [-Connection < Hashtable >] [-SiteId] < String > [-Correction] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Correction < Object >

    Required parameter. A correction with the following structure:
    
        - id: string
        - site_id: string
        - object_id: string
        - group_id: string
        - reason: string
        - status: string
        - changes: CorrectionChangeV1[]
          - param_name: string
          - rule_id: string
          - zone_id: string
          - value: number

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Update-IqpCorrection -SiteId 1 -Correction @{ site_id="1"; object_id="1"; status="Requested"; reason="Test"; changes=@( @{ param_name="distance"; value=10 } ) }

---

# <a name="delete-correction">Remove-IqpCorrection</a>
    
### Description

Deletes existing correction
    
### Syntax

    Remove-IqpCorrection [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Id < String >

    A correction id. Required parameter. Can be retrieved from Get-IqpCorrections

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Remove-IqpCorrection -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2