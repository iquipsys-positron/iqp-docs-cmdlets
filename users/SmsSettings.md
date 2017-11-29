Page navigation

* [Get user sms settings](#smsSettings)
* [Update user sms settings](#set-smsSettings)
* [Request sms verification](#request-verification)
* [Submit sms verification](#submit-verification)

---

# <a name="smsSettings">Get-IqtSmsSettings</a>
   
### Description

Gets all users sms settings by its id
    
### Syntax

    Get-IqtSmsSettings [-Connection < Hashtable >] [-Id] < String > [< CommonParameters >]
    
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
    
    C:\PS>Get-IqtSmsSettings -Id 9cfaf79bc95b4a9e912314eb3db7a4ba

---

# <a name="set-smsSettings">Set-IqtSmsSettings</a>
   
### Description

Sets all users sms settings defined by its id
    
### Syntax

    Set-IqtSmsSettings [-Connection < Hashtable >] [-Settings] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

    A connection object

- Settings < Object >

        An user sms settings with the following structure
        - id: string
        - name: string
        - phone: string
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
    
    C:\PS>Set-IqtSmsSettings -Settings @{ id="123"; name="Test user"; phone="+79102340238"; language="en" }

---

# <a name="request-verification">Request-IqtSmsVerification</a>
   
### Description

Requests a sms verification message by user login
    
### Syntax

    Request-IqtSmsVerification [-Connection < Hashtable >] [-Login] < String > [< CommonParameters >]
    
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
    
    C:\PS>Request-IqtSmsVerification -Login test@somewhere.com

---

# <a name="submit-verification">Submit-IqtPhoneVerification</a>
   
### Description

Verifies user phone number using reset code sent via sms
    
### Syntax

    Request-IqtPhoneVerification [-Connection < Hashtable >] [-Login] < String > [-Code] < String > [< CommonParameters >]
    
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
    
    C:\PS>Request-IqtPhoneVerification -Login test@somewhere.com -Code 1245