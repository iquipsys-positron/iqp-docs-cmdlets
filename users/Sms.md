# <a name="send-sms">Send-IqtSms</a>

### Description

Requests sms message to arbitrary address
    
### Syntax

    Send-IqtSms [-Connection < Hashtable >] [-Message] < Object > [[-Recipient] < Object >]  [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- Message < Object >

    Required parameter. A message with the following structure:
    
        - from: string
        - to: string
        - text: string

- Recipient <Object>

    Optional recipient identified who is a system user

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed system administrator role.

### Example
    
    C:\PS>Send-IqtSms -Message @{ to="+79102342938"; text="This is a test sms" }