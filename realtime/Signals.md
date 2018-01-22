Page navigation

* [Get worksite signals](#signals)
* [Send signal](#send-signal)
* [Lock signal](#lock-signal)
* [Complete signal](#complete-signal)
* [Delete signal](#delete-signal)

---

# <a name="signals">Get-IqpSignals</a>
   
### Description

Gets a page with signals that satisfy specified criteria
    
### Syntax

    Get-IqpSignals [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
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

To execute this cmdlet needed site admin or higher roles.

### Example
    
    C:\PS>Get-IqpSignals -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Filter @{ type=1 } -Take 10

---

# <a name="send-signal">Send-IqpSignal</a>

### Description

Sends a signal to device
    
### Syntax

    New-IqpSignal [-Connection < Hashtable >] [-SiteId] < String > [-Signal] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Signal < Object >

    Required parameter. A signal with the following structure:
    
        - id: string
        - site_id: string
        - device_id: string
        - type: number (1: Attention, 2: Confirmation, 3: Warning, 4: Emergency)

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Send-IqpSignal -SiteId 1 -Signal @{ site_id="1"; device_id="123"; type=3 }

---

# <a name="lock-signal">Lock-IqpSignal</a>
 
### Description

Puts a temporary lock on signal by its unique id
    
### Syntax

    Lock-IqpSignal [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Id < String >

    A signal id. Required parameter. Can be retrieved from Get-IqpSignals.

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site admin or higher roles.

### Example
    
    C:\PS>Lock-IqpSignal -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="complete-signal">Complete-IqpSignal</a>
 
### Description

Marks signal as sent to complete its delivery
    
### Syntax

    Complete-IqpSignal [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Id < String >

    A signal id. Required parameter. Can be retrieved from Get-IqpSignals.

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site admin or higher roles.

### Example
    
    C:\PS>Complete-IqpSignal -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="delete-signal">Remove-IqpSignal</a>
    
### Description

Removes signal by its unique id
    
### Syntax

    Remove-IqpSignal [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Id < String >

    A signal id. Required parameter. Can be retrieved from Get-IqpSignals

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Remove-IqpSignal -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2