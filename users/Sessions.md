Page navigation

* [Register new user account](#signup)
* [Sign in to existing user account](#signin)
* [Sign out from user account](#signout)
* [Get sessions](#sessions)
* [Get current session](#current-session)

---

# <a name="signup">Register-IqtUser</a>

### Description

Performs signup and opens a new session
    
### Syntax

     Register-IqtUser [-Connection < Hashtable >] [-User] < Object > [< CommonParameters >]
    
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
    
    C:\PS>Register-IqtUser -User @{ name="Test User"; login="test"; email="test@somewhere.com"; password="test123" }

---

# <a name="signin">Open-IqtSession</a>

### Description

Open-IqtSession opens connection and starts a new user session with client facade
    
### Syntax

     Open-IqtSession [-Connection < Hashtable >] [-Login] < String > [-Password] < String > [< CommonParameters >]
    
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
    
    C:\PS>$conn = Open-IqtSession -Login "test1@somewhere.com" -Password "mypassword"

---

# <a name="signout">Close-IqtSession</a>

### Description

Closes previously opened user session with client facade
    
### Syntax

     Close-IqtSession [-Connection < Hashtable >] [< CommonParameters >]
    
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
    
    C:\PS>Close-IqtSession

---

# <a name="sessions">Get-IqtSessions</a>
   
### Description

Gets a page with sessions that satisfy specified criteria
    
### Syntax

    Get-IqtSessions [-Connection < Hashtable >] [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
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
    
    C:\PS>Get-IqtSessions -Take 10

---

# <a name="current-session">Get-IqtCurrentSession</a>
   
### Description

Gets the current session
    
### Syntax

    Get-IqtCurrentSession [-Connection < Hashtable >] [< CommonParameters >]
    
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
    
    C:\PS>Get-IqtCurrentSession