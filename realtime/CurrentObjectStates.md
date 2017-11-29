Page navigation

* [Get worksite current object states](#CurrentObjectStates)
* [Get current object state info](#CurrentObjectState)
* [Create current object state](#new-CurrentObjectState)
* [Update current object state](#edit-CurrentObjectState)
* [Delete current object state by id](#delete-CurrentObjectState)
* [Delete current object states by filter criteria](#delete-CurrentObjectStates)
* [Send state update](#send-stateUpdate)

---

# <a name="CurrentObjectStates">Get-IqtCurrentObjectStates</a>
   
### Description

Reads current states for control objects service
    
### Syntax

    Get-IqtCurrentObjectStates [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
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
    
    C:\PS>Get-IqtCurrentObjectStates -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Take 10

---

# <a name="CurrentObjectState">Get-IqtCurrentObjectState</a>

### Description

Gets current state by state/device id
    
### Syntax

    Get-IqtCurrentObjectState [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites
        
- Id < String >

    A state or device id.

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site user or higher roles.    

### Example
    
    C:\PS>Get-IqtCurrentObjectState -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="new-CurrentObjectState">Set-IqtCurrentObjectState</a>

### Description

Sets current state for control object object
    
### Syntax

    New-IqtCurrentObjectState [-Connection < Hashtable >] [-SiteId] < String > [-State] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites
        
- CurrentObjectState < Object >

    Required parameter. A state with the following structure:
    
        - id: string
        - site_id: string
        - device_id: string
        - object_id: string
        - assigned_id: string
        - online: number
        - immobile: number
        - time: Date
        - pos: any // GeoJSON
        - alt: number
        - angle: number
        - speed: number

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site admin or higher roles.

### Example
    
    C:\PS>Set-IqtCurrentState -SiteId 1 -State @{ site_id="1"; device_id="1"; time=$(Get-Date); immobile=0; emergency=0  }

---

# <a name="edit-CurrentObjectState">Update-IqtCurrentObjectState</a>
 
### Description

Changes current state, calculates all rules, generates events and logs historical records
    
### Syntax

    Update-IqtCurrentObjectState [-Connection < Hashtable >] [-SiteId] < String > [-State] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites
        
- State < Object >

    Required parameter. A state with the following structure:
    
        - site_id: string
        - device_id: string
        - immobile: boolean
        - time: Date
        - lat: number
        - long: number
        - alt: number
        - angle: number
        - speed: number

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site admin or higher roles.

### Example
    
    C:\PS>Update-IqtCurrentState -SiteId 1 -State @{ site_id="1"; device_id="1"; time=$(Get-Date); immobile=$false; emergency=$false  }

---

# <a name="delete-CurrentObjectState">Remove-IqtCurrentObjectState</a>
    
### Description

Removes current state by state/device id
    
### Syntax

    Remove-IqtCurrentObjectState [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites
        
- Id < String >

    A state or device id.

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site admin or higher roles.

### Example
    
    C:\PS>Remove-IqtCurrentObjectState -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="delete-CurrentObjectStates">Remove-IqtCurrentObjectStates</a>
    
### Description

Removes states from currobjectstates service that satisfy specified criteria
    
### Syntax

    Remove-IqtCurrentObjectState [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [[-Filter] < Hashtable >] [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites
        
- Id < String >

    A state or device id.

- Filter < Hashtable >

    A filter with search criteria (default: no filter)

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site admin or higher roles.

### Example
    
    C:\PS>Remove-IqtCurrentObjectStates -SiteId 1 -Filter @{ immobile=$true }

---

# <a name="send-stateUpdate">Send-IqtObjectStateUpdate</a>
 
### Description

Initiate update of the current state, calculates all rules, generates events and logs historical records. Updates current state of specified object asynchronously
    
### Syntax

    Send-IqtObjectStateUpdate [-Connection < Hashtable >] [-SiteId] < String > [-State] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqtSites
        
- State < Object >

    Required parameter. A state with the following structure:
    
        - site_id: string
        - device_id: string
        - immobile: boolean
        - time: Date
        - lat: number
        - long: number
        - alt: number
        - angle: number
        - speed: number

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site admin or higher roles.

### Example
    
    C:\PS>Send-IqtObjectStateUpdate -SiteId 1 -State @{ site_id="1"; device_id="1"; time=$(Get-Date); immobile=$false; emergency=$false  }
