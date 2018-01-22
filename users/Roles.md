Page navigation

* [Set account roles](#get-roles)
* [Grant roles to account](#grant-roles)
* [Revoke roles from account](#revoke-roles)

---

# <a name="get-roles">Get-IqpRoles</a>
   
### Description

Gets all assigned roles to a user by its id
    
### Syntax

    Get-IqpRoles [-Connection < Hashtable >]  [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

    A connection object

- Id < String >
    
    A user account id. Can be retrieved from Get-IqpAccounts.
        
- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed system administrator role.

### Example
    
    C:\PS>Set-IqpPassword -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="grant-roles">Grant-IqpRoles</a>
   
### Description

Grants roles to a user
    
### Syntax

    Get-IqpRoles [-Connection < Hashtable >]  [-Id] < String > [-Roles] < String[] > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

    A connection object

- Id < String >
    
    A user account id. Can be retrieved from Get-IqpAccounts.

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
    
    C:\PS>Grant-IqpRoles -Id 123 -Roles admin

---

# <a name="revoke-roles">Revoke-IqpRoles</a>
   
### Description

Revokes roles from a user
    
### Syntax

    Revoke-IqpRoles [-Connection < Hashtable >]  [-Id] < String > [-Roles] < String[] > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

    A connection object

- Id < String >
    
    A user account id. Can be retrieved from Get-IqpAccounts.

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
    
    C:\PS>Revoke-IqpRoles -Id 123 -Roles admin