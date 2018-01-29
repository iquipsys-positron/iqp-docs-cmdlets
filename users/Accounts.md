Page navigation

* [Get accounts](#accounts)
* [Get account info by id](#account)
* [Get current account info](#current-account)
* [Create account](#new-account)
* [Update account](#edit-account)
* [Delete account](#delete-account)

---

# <a name="accounts">Get-IqsAccounts</a>
   
### Description

Gets a page with accounts that satisfy specified criteria
    
### Syntax

    Get-IqsAccounts [-Connection < Hashtable >] [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
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

Any signed user car execute this cmdlet.

### Example
    
    C:\PS>Get-IqsAccounts -Take 10

---

# <a name="account">Get-IqsAccount</a>

### Description

Gets user account by its unique id
    
### Syntax

    Get-IqsAccount [-Connection < Hashtable >] [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- Id < String >

    A user account id. Required parameter. Can be retrieved from Get-IqsAccounts

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed system administrator role or use own id.

### Example
    
    C:\PS>Get-IqsAccount -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="current-account">Get-IqsCurrentAccount</a>
   
### Description

Gets the current user account
    
### Syntax

    Get-IqsCurrentAccount [-Connection < Hashtable >] [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

Any signed user car execute this cmdlet.

### Example
    
    C:\PS>Get-IqsCurrentAccount

---

# <a name="new-account">New-IqsAccount</a>

### Description

Creates a new user account, sets email address and temporary password. Check the assigned password in the result object.
    
### Syntax

    New-IqsAccount [-Connection < Hashtable >] [-Account] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- Account < Object >

    Required parameter. A account with the following structure:
    
        - email: string
        - name: string
        - login: string
        - password: string
        - about: string (optional)
        - theme: string  (optional)
        - language: string (optional)
        - theme: string (optional)

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed system admistrator role.

### Example
    
    C:\PS>New-IqsAccount -Account @{ name="Test User"; login="test"; email="test@somewhere.com" }

---

# <a name="edit-account">Update-IqsAccount</a>
 
### Description

Updates existing account
    
### Syntax

    Update-IqsAccount [-Connection < Hashtable >] [-Account] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- Account < Object >

    Required parameter. A account with the following structure:
    
        - email: string
        - name: string
        - login: string
        - password: string
        - about: string (optional)
        - theme: string  (optional)
        - language: string (optional)
        - theme: string (optional)

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles or use own Id.

### Example
    
    C:\PS>Update-IqsAccount -Account @{ name="Test User"; login="test"; email="test@somewhere.com"; }

---

# <a name="delete-account">Remove-IqsAccount</a>
    
### Description

Removes user account by its unique id
    
### Syntax

    Remove-IqsAccount [-Connection < Hashtable >] [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- Id < String >

    A account id. Required parameter. Can be retrieved from Get-IqsAccounts

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed system administrator role.

### Example
    
    C:\PS>Remove-IqsAccount -Id 85e52f3abf2e4091b489dc4f01df2df2