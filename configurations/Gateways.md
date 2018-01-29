Page navigation

* [Get worksite gateways](#gateways)
* [Get gateway info](#gateway)
* [Create gateway](#new-gateway)
* [Update gateway](#edit-gateway)
* [Delete gateway](#delete-gateway)
* [Ping gateway](#ping-gateway)
* [Get gateway statistics](#stats-gateway)

---

# <a name="gateways">Get-IqsGateways</a>
   
### Description

Gets a page with gateways that satisfy specified criteria
    
### Syntax

    Get-IqsGateways [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
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
    
    C:\PS>Get-IqsGateways -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Filter @{ udi="23433455" } -Take 10

---

# <a name="gateway">Get-IqsGateway</a>

### Description

Gets gateway by its unique id
    
### Syntax

    Get-IqsGateway [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Id < String >

    A gateway id. Required parameter. Can be retrieved from Get-IqsGateways

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 
To execute this cmdlet needed site user or higher roles.    

### Example
    
    C:\PS>Get-IqsGateway -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="new-gateway">New-IqsGateway</a>

### Description

Creates new gateway
    
### Syntax

    New-IqsGateway [-Connection < Hashtable >] [-SiteId] < String > [-Gateway] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Gateway < Object >

    Required parameter. A gateway with the following structure:
    
        - id: string
        - site_id: string
        - model: string
        - version: number
        - udi: string
        - label: string
        - create_time: Date
        - active: boolean

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site admin or higher roles.

### Example
    
    C:\PS>New-IqsGateway -SiteId 1 -Gateway @{ site_id="1"; model="MCTD"; udi="134552345"; label="Main building"; active=$true }

---

# <a name="edit-gateway">Update-IqsGateway</a>
 
### Description

Updates existing gateway
    
### Syntax

    Update-IqsGateway [-Connection < Hashtable >] [-SiteId] < String > [-Gateway] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Gateway < Object >

    Required parameter. A gateway with the following structure:
    
        - id: string
        - site_id: string
        - model: string
        - version: number
        - udi: string
        - label: string
        - create_time: Date
        - active: boolean

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site admin or higher roles.

### Example
    
    C:\PS>Update-IqsGateway -SiteId 1 -Gateway @{ site_id="1"; model="MCTD"; udi="3454363645"; label="Main building"; active=$true }

---

# <a name="delete-gateway">Remove-IqsGateway</a>
    
### Description

Deletes existing gateway by id.
    
### Syntax

    Remove-IqsGateway [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Id < String >

    A gateway id. Required parameter. Can be retrieved from Get-IqsGateways

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site admin or higher roles.

### Example
    
    C:\PS>Remove-IqsGateway -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="ping-gateway">Ping-IqsGateway</a>

### Description

Pings an existing gateway
    
### Syntax

    Ping-IqsGateway [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Id < String >

    A gateway id. Required parameter. Can be retrieved from Get-IqsGateways

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site admin or higher roles.

### Example
    
    C:\PS>Ping-IqsGateway -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="stats-gateway">Request-IqsGatewayStats</a>

### Description

Requests comm statistics from an existing gateway
    
### Syntax

    Request-IqsGatewayStats [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
- Id < String >

    A gateway id. Required parameter. Can be retrieved from Get-IqsGateways

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site admin or higher roles.

### Example
    
    C:\PS>Request-IqsGatewayStats -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2