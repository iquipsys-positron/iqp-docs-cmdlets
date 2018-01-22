Page navigation

* [Send status update](#send-update)

---

# <a name="send-update">Send-IqpStatusUpdate</a>

### Description

Sends device status update through REST gateway. The device shall be registered at least for one site
    
### Syntax

    Send-IqpStatusUpdate [-Connection < Hashtable >] [-Message] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- Message < Object >

    Required parameter. A status update message.

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed system administrator role.

### Example
    
    C:\PS>Send-IqpStatusUpdate -Message @{ device_udi="+15202250000"; lat=32.01; long=-110.22; alt=720; angle=45; speed=30; quality=2; pressed=false }