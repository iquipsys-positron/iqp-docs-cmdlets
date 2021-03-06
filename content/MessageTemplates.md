Page navigation

* [Get all message templates](#MessageTemplates)
* [Get message templates info](#MessageTemplate)
* [Create message templates](#new-MessageTemplate)
* [Update message templates](#edit-MessageTemplate)
* [Delete message templates](#delete-MessageTemplate)

---

# <a name="MessageTemplates">Get-IqsMessageTemplates</a>
   
### Description

Gets a page with message templates that satisfy specified criteria
    
### Syntax

    Get-IqsMessageTemplates [-Connection < Hashtable >] [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
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

To execute this cmdlet needed system administator role.

### Example
    
    C:\PS>Get-IqsMessageTemplates -Filter @{ name="Welcome Message" } -Take 10

---

# <a name="MessageTemplate">Get-IqsMessageTemplate</a>

### Description

Gets MessageTemplate by its unique id
    
### Syntax

    Get-IqsMessageTemplate [-Connection < Hashtable >] [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- Id < String >

    A message template id. Required parameter. Can be retrieved from Get-IqsMessageTemplates

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed system administator role.  

### Example
    
    C:\PS>Get-IqsMessageTemplate -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="new-MessageTemplate">New-IqsMessageTemplate</a>

### Description

Creates new message template
    
### Syntax

    New-IqsMessageTemplate [-Connection < Hashtable >] [-MessageTemplate] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- MessageTemplate < Object >

    Required parameter. A MessageTemplate with the following structure:
    
        - id: string
        - name: string
        - from: string
        - reply_to: string
        - subject: MultiString
        - text: MultiString
        - html: MultiString
        - status: string - new, writing, translating, verifying, completed

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed system administator role.

### Example
    
    C:\PS>New-IqsMessageTemplate -MessageTemplate @{ text=@{ en="Hurry slowly" }; author=@{ en="Russian proverb" }; status="completed" }

---

# <a name="edit-MessageTemplate">Update-IqsMessageTemplate</a>
 
### Description

Updates existing message template
    
### Syntax

    Update-IqsMessageTemplate [-Connection < Hashtable >] [-MessageTemplate] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- MessageTemplate < Object >

    Required parameter. A MessageTemplate with the following structure:
    
        - id: string
        - name: string
        - from: string
        - reply_to: string
        - subject: MultiString
        - text: MultiString
        - html: MultiString
        - status: string - new, writing, translating, verifying, completed

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed system administator role.

### Example
    
    C:\PS>Update-IqsMessageTemplate -MessageTemplate @{ text=@{ en="Hurry slowly" }; author=@{ en="Russian proverb" }; status="completed" }

---

# <a name="delete-MessageTemplate">Remove-IqsMessageTemplate</a>
    
### Description

Deletes existing message template
    
### Syntax

    Remove-IqsMessageTemplate [-Connection < Hashtable >] [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- Id < String >

    A message template id. Required parameter. Can be retrieved from Get-IqsMessageTemplates

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed system administator role.

### Example
    
    C:\PS>Remove-IqsMessageTemplate -Id 85e52f3abf2e4091b489dc4f01df2df2