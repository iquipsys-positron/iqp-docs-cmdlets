Page navigation

* [Set user password](#get-roles)
* [Request changing password](#request-password)
* [Change user password](#reset-password)

---

# <a name="get-roles">Get-IqtRoles</a>
   
### Description

Gets all assigned roles to a user by its id
    
### Syntax

    Get-IqtRoles [-Connection < Hashtable >]  [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

    A connection object

- Id < String >
    
    A user account id. Can be retrieved from Get-IqtAccounts.
        
- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed system administrator role.

### Example
    
    C:\PS>Set-IqtPassword -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="grant-roles">Grant-IqtRoles</a>
   
### Description

Grants roles to a user
    
### Syntax

    Get-IqtRoles [-Connection < Hashtable >]  [-Id] < String > [-Roles] < String[] > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

    A connection object

- Id < String >
    
    A user account id. Can be retrieved from Get-IqtAccounts.

- Roles <String[]>

    Single role or array of string roles to grant.
        
- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed system administrator role.

### Example
    
    C:\PS>Grant-IqtRoles -Id 123 -Roles admin

---

# <a name="revoke-roles">Revoke-IqtRoles</a>
   
### Description

Revokes roles from a user
    
### Syntax

    Revoke-IqtRoles [-Connection < Hashtable >]  [-Id] < String > [-Roles] < String[] > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

    A connection object

- Id < String >
    
    A user account id. Can be retrieved from Get-IqtAccounts.

- Roles <String[]>

    Single role or array of string roles that needs to be revoked.
        
- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed system administrator role.

### Example
    
    C:\PS>Revoke-IqtRoles -Id 123 -Roles admin