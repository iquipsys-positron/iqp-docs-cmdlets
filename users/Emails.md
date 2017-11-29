# <a name="send-email">Send-IqtEmail</a>

### Description

Requests email message to arbitrary address
    
### Syntax

    Send-IqtEmail [-Connection < Hashtable >] [-Message] < Object > [[-Recipient] < Object >]  [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- Message < Object >

    Required parameter. A message with the following structure:
    
        - from: string
        - to: string
        - cc: string
        - subject: string
        - text: string
        - html: string

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
    
    C:\PS>Send-IqtEmail -Message @{ to="somebody@somewhere.com"; subject="Test"; text="This is a test email" }