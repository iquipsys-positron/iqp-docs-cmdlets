Page navigation

* [Get accounts](#accounts)
* [Get account info by id](#account)
* [Get current account info](#current-account)
* [Create account](#new-account)
* [Update account](#edit-account)
* [Delete account](#delete-account)

---

# <a name="accounts">Get-IqtAccounts</a>
   
### Description

Gets a page with accounts that satisfy specified criteria
    
### Syntax

    Get-IqtAccounts [-Connection < Hashtable >] [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
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
    
    C:\PS>Get-IqtAccounts -Take 10

---

# <a name="account">Get-IqtAccount</a>

### Description

Gets user account by its unique id
    
### Syntax

    Get-IqtAccount [-Connection < Hashtable >] [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- Id < String >

    A user account id. Required parameter. Can be retrieved from Get-IqtAccounts

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed system administrator role or use own id.

### Example
    
    C:\PS>Get-IqtAccount -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="current-account">Get-IqtCurrentAccount</a>
   
### Description

Gets the current user account
    
### Syntax

    Get-IqtAccounts [-Connection < Hashtable >] [< CommonParameters >]
    
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
    
    C:\PS>Get-IqtCurrentAccount

---

# <a name="new-account">New-IqtAccount</a>

### Description

Creates a new user account, sets email address and temporary password. Check the assigned password in the result object.
    
### Syntax

    New-IqtAccount [-Connection < Hashtable >] [-Account] < Object > [< CommonParameters >]
    
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
    
    C:\PS>New-IqtAccount -Account @{ name="Test User"; login="test"; email="test@somewhere.com" }

---

# <a name="edit-account">Update-IqtAccount</a>
 
### Description

Updates existing account
    
### Syntax

    Update-IqtAccount [-Connection < Hashtable >] [-Account] < Object > [< CommonParameters >]
    
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
    
    C:\PS>Update-IqtAccount -Account @{ name="Test User"; login="test"; email="test@somewhere.com"; }

---

# <a name="delete-account">Remove-IqtAccount</a>
    
### Description

Removes user account by its unique id
    
### Syntax

    Remove-IqtAccount [-Connection < Hashtable >] [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- Id < String >

    A account id. Required parameter. Can be retrieved from Get-IqtAccounts

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed system administrator role.

### Example
    
    C:\PS>Remove-IqtAccount -Id 85e52f3abf2e4091b489dc4f01df2df2