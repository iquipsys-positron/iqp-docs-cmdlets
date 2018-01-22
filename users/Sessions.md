Page navigation

* [Register new user account](#signup)
* [Sign in to existing user account](#signin)
* [Sign out from user account](#signout)
* [Get sessions](#sessions)
* [Get current session](#current-session)

---

# <a name="signup">Register-IqpUser</a>

### Description

Performs signup and opens a new session
    
### Syntax

     Register-IqpUser [-Connection < Hashtable >] [-User] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        

- User < Object >

    Required parameter. A user with the following structure:
    
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

Anybody can execute this cmdlet.

### Example
    
    C:\PS>Register-IqpUser -User @{ name="Test User"; login="test"; email="test@somewhere.com"; password="test123" }

---

# <a name="signin">Open-IqpSession</a>

### Description

Open-IqpSession opens connection and starts a new user session with client facade
    
### Syntax

     Open-IqpSession [-Connection < Hashtable >] [-Login] < String > [-Password] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object

- Login < String >
    
    User login
        
- Password < String >
    
    User password

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

Anybody can execute this cmdlet.

### Example
    
    C:\PS>$conn = Open-IqpSession -Login "test1@somewhere.com" -Password "mypassword"

---

# <a name="signout">Close-IqpSession</a>

### Description

Closes previously opened user session with client facade
    
### Syntax

     Close-IqpSession [-Connection < Hashtable >] [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

Any signed user can execute this cmdlet.

### Example
    
    C:\PS>Close-IqpSession

---

# <a name="sessions">Get-IqpSessions</a>
   
### Description

Gets a page with sessions that satisfy specified criteria
    
### Syntax

    Get-IqpSessions [-Connection < Hashtable >] [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
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

To execute this cmdlet needed system administrator role.

### Example
    
    C:\PS>Get-IqpSessions -Take 10

---

# <a name="current-session">Get-IqpCurrentSession</a>
   
### Description

Gets the current session
    
### Syntax

    Get-IqpCurrentSession [-Connection < Hashtable >] [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
   
- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

Any signed user can execute this cmdlet.

### Example
    
    C:\PS>Get-IqpCurrentSession