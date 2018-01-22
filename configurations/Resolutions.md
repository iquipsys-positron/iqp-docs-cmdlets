Page navigation

* [Get worksite resolutions](#resolutions)
* [Get resolution info](#resolution)
* [Create resolution](#new-resolution)
* [Update resolution](#edit-resolution)
* [Delete resolution](#delete-resolution)

---

# <a name="resolutions">Get-IqpResolutions</a>
   
### Description

Gets a page with resolutions that satisfy specified criteria
    
### Syntax

    Get-IqpResolutions [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
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
    
    C:\PS>Get-IqpResolutions -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Filter @{ resolution="Call supervisor" } -Take 10

---

# <a name="resolution">Get-IqpResolution</a>

### Description

Gets resolution by its unique id
    
### Syntax

    Get-IqpResolution [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Id < String >

    A resolution id. Required parameter. Can be retrieved from Get-IqpResolutions

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site user or higher roles.    

### Example
    
    C:\PS>Get-IqpResolution -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="new-resolution">New-IqpResolution</a>

### Description

Creates new resolution
    
### Syntax

    New-IqpResolution [-Connection < Hashtable >] [-SiteId] < String > [-Resolution] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Resolution < Object >

    Required parameter. A resolution with the following structure:
    
        - id: string
        - site_id: string
        - rule_id: string
        - resolution: string

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>New-IqpResolution -SiteId 1 -Resolution @{ site_id="1"; rule_id="1"; resolution="Escalated to management" }

---

# <a name="edit-resolution">Update-IqpResolution</a>
 
### Description

Updates existing resolution
    
### Syntax

    Update-IqpResolution [-Connection < Hashtable >] [-SiteId] < String > [-Resolution] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Resolution < Object >

    Required parameter. A resolution with the following structure:
    
        - id: string
        - site_id: string
        - rule_id: string
        - resolution: string

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Update-IqpResolution -SiteId 1 -Resolution @{ site_id="1"; rule_id="1"; resolution="Escalated to management" }

---

# <a name="delete-resolution">Remove-IqpResolution</a>
    
### Description

Deletes existing resolution.
    
### Syntax

    Remove-IqpResolution [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Id < String >

    A resolution id. Required parameter. Can be retrieved from Get-IqpResolutions

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Remove-IqpResolution -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2