Page navigation

* [Set user password](#set-password)
* [Request changing password](#request-password)
* [Change user password](#reset-password)

---

# <a name="set-password">Set-IqpPassword</a>
   
### Description

Changes user password
    
### Syntax

    Set-IqpPassword [-Connection < Hashtable >] [-OldPassword] < String > [-NewPassword] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

    A connection object

- OldPassword < String >
    
    An old password
        
- NewPassword < String >
    
    A new password
        
- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed system administrator role or use own user id.

### Example
    
    C:\PS>Set-IqpPassword -OldPassword "oldpwd" -NewPassword "newpwd"

---

# <a name="request-password">Request-IqpPassword</a>
   
### Description

Requests a password recovery email. The email is set to the account primary email with reset code
    
### Syntax

    Request-IqpPassword [-Connection < Hashtable >] [-Login] < String > [< CommonParameters >]
    
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
    
    C:\PS>Request-IqpPassword -Login test@somewhere.com

---

# <a name="reset-password">Reset-IqpPassword</a>
   
### Description

Resets user password using reset code sent by email
    
### Syntax

    Reset-IqpPassword [-Connection < Hashtable >] [-Login] < String > [-Code] < String > [-Password] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

    A connection object

- Login < String >
    
    User login

- Code < String >
    
    Reset code

- Password < String >
    
    A new password

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

Anybody can execute this cmdlet.

### Example
    
    C:\PS>Reset-IqpPassword -Login test@somewhere.com -Code 1245 -Password pass123