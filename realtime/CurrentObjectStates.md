Page navigation

* [Get worksite current object states](#CurrentObjectStates)
* [Get current object state info](#CurrentObjectState)
* [Create current object state](#new-CurrentObjectState)
* [Update current object state](#edit-CurrentObjectState)
* [Delete current object state by id](#delete-CurrentObjectState)
* [Delete current object states by filter criteria](#delete-CurrentObjectStates)
* [Send state update](#send-stateUpdate)

---

# <a name="CurrentObjectStates">Get-IqsCurrentObjectStates</a>
   
### Description

Reads current states for control objects service
    
### Syntax

    Get-IqsCurrentObjectStates [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
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
    
    C:\PS>Get-IqsCurrentObjectStates -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Take 10

---

# <a name="CurrentObjectState">Get-IqsCurrentObjectState</a>

### Description

Gets current state by state/device id
    
### Syntax

    Get-IqsCurrentObjectState [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
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
    
    C:\PS>Get-IqsCurrentObjectState -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="new-CurrentObjectState">Set-IqsCurrentObjectState</a>

### Description

Sets current state for control object object
    
### Syntax

    New-IqsCurrentObjectState [-Connection < Hashtable >] [-SiteId] < String > [-State] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
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
    
    C:\PS>Set-IqsCurrentState -SiteId 1 -State @{ site_id="1"; device_id="1"; time=$(Get-Date); immobile=0; emergency=0  }

---

# <a name="edit-CurrentObjectState">Update-IqsCurrentObjectState</a>
 
### Description

Changes current state, calculates all rules, generates events and logs historical records
    
### Syntax

    Update-IqsCurrentObjectState [-Connection < Hashtable >] [-SiteId] < String > [-State] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
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
    
    C:\PS>Update-IqsCurrentState -SiteId 1 -State @{ site_id="1"; device_id="1"; time=$(Get-Date); immobile=$false; emergency=$false  }

---

# <a name="delete-CurrentObjectState">Remove-IqsCurrentObjectState</a>
    
### Description

Removes current state by state/device id
    
### Syntax

    Remove-IqsCurrentObjectState [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
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
    
    C:\PS>Remove-IqsCurrentObjectState -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="delete-CurrentObjectStates">Remove-IqsCurrentObjectStates</a>
    
### Description

Removes states from currobjectstates service that satisfy specified criteria
    
### Syntax

    Remove-IqsCurrentObjectState [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [[-Filter] < Hashtable >] [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
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
    
    C:\PS>Remove-IqsCurrentObjectStates -SiteId 1 -Filter @{ immobile=$true }

---

# <a name="send-stateUpdate">Send-IqsObjectStateUpdate</a>
 
### Description

Initiate update of the current state, calculates all rules, generates events and logs historical records. Updates current state of specified object asynchronously
    
### Syntax

    Send-IqsObjectStateUpdate [-Connection < Hashtable >] [-SiteId] < String > [-State] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqsSites
        
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
    
    C:\PS>Send-IqsObjectStateUpdate -SiteId 1 -State @{ site_id="1"; device_id="1"; time=$(Get-Date); immobile=$false; emergency=$false  }
