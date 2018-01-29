Page navigation

* [Get worksite resolutions](#resolutions)
* [Get resolution info](#resolution)
* [Create resolution](#new-resolution)
* [Update resolution](#edit-resolution)
* [Delete resolution](#delete-resolution)

---

# <a name="resolutions">Get-IqsResolutions</a>
   
### Description

Gets a page with resolutions that satisfy specified criteria
    
### Syntax

    Get-IqsResolutions [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
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
    
    C:\PS>Get-IqsResolutions -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Filter @{ resolution="Call supervisor" } -Take 10

---

# <a name="resolution">Get-IqsResolution</a>

### Description

Gets resolution by its unique id
    
### Syntax

    Get-IqsResolution [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Id < String >

    A resolution id. Required parameter. Can be retrieved from Get-IqsResolutions

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site user or higher roles.    

### Example
    
    C:\PS>Get-IqsResolution -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="new-resolution">New-IqsResolution</a>

### Description

Creates new resolution
    
### Syntax

    New-IqsResolution [-Connection < Hashtable >] [-SiteId] < String > [-Resolution] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
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
    
    C:\PS>New-IqsResolution -SiteId 1 -Resolution @{ site_id="1"; rule_id="1"; resolution="Escalated to management" }

---

# <a name="edit-resolution">Update-IqsResolution</a>
 
### Description

Updates existing resolution
    
### Syntax

    Update-IqsResolution [-Connection < Hashtable >] [-SiteId] < String > [-Resolution] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
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
    
    C:\PS>Update-IqsResolution -SiteId 1 -Resolution @{ site_id="1"; rule_id="1"; resolution="Escalated to management" }

---

# <a name="delete-resolution">Remove-IqsResolution</a>
    
### Description

Deletes existing resolution.
    
### Syntax

    Remove-IqsResolution [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Id < String >

    A resolution id. Required parameter. Can be retrieved from Get-IqsResolutions

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Remove-IqsResolution -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2