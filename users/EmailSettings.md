Page navigation

* [Get user email settings](#emailSettings)
* [Update user email settings](#set-emailSettings)
* [Request email verification](#request-verification)
* [Submit email verification](#submit-verification)

---

# <a name="emailSettings">Get-IqtEmailSettings</a>
   
### Description

Gets all users email settings by its id
    
### Syntax

    Get-IqtEmailSettings [-Connection < Hashtable >] [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

    A connection object

- Id < String >

    A unique user id. Can be retrieved from Get-IqtAccounts
        
- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed system administrator role or use own user id.

### Example
    
    C:\PS>Get-IqtEmailSettings -Id 9cfaf79bc95b4a9e912314eb3db7a4ba

---

# <a name="set-emailSettings">Set-IqtEmailSettings</a>
   
### Description

Sets all users email settings defined by its id
    
### Syntax

    Set-IqtEmailSettings [-Connection < Hashtable >] [-Settings] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

    A connection object

- Settings < Object >

        An user email settings with the following structure
        - id: string
        - name: string
        - email: string
        - language: string
        - subscriptions: any
        - custom_hdr: any
        - custom_dat: any
        
- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed system administrator role or use own user id.

### Example
    
    C:\PS>Set-IqtEmailSettings -Settings @{ id="9cfaf79bc95b4a9e912314eb3db7a4ba"; name="Test user"; email="test@somewhere.com"; language="en" }

---

# <a name="request-verification">Request-IqtEmailVerification</a>
   
### Description

Requests a email verification message by user login
    
### Syntax

    Request-IqtEmailVerification [-Connection < Hashtable >] [-Login] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

    A connection object

- Login < String >

    User login

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

Anybody can execute this cmdlet.

### Example
    
    C:\PS>Request-IqtEmailVerification -Login test@somewhere.com

---

# <a name="submit-verification">Submit-IqtEmailVerification</a>
   
### Description

Verifies user email address using reset code sent by email
    
### Syntax

    Request-IqtEmailVerification [-Connection < Hashtable >] [-Login] < String > [-Code] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

    A connection object

- Login < String >

    User login

- Code < String >

    Reset code

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

Anybody can execute this cmdlet.

### Example
    
    C:\PS>Request-IqtEmailVerification -Login test@somewhere.com -Code 1245