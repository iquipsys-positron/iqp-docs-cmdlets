Page navigation

* [Get worksite invitations](#invitations)
* [Get invitation info](#invitation)
* [Send invitation](#send-invitation)
* [Delete invitation](#delete-invitation)

---

# <a name="invitations">Get-IqpInvitations</a>
   
### Description

Gets a page with invitations that satisfy specified criteria
    
### Syntax

    Get-IqpInvitations [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
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

To execute this cmdlet needed site user or higher roles.

### Example
    
    C:\PS>Get-IqpInvitations -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba

---

# <a name="invitation">Get-IqpInvitation</a>

### Description

Gets invitation by its unique id
    
### Syntax

    Get-IqpInvitation [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Id < String >

    A invitation id. Required parameter. Can be retrieved from Get-IqpInvitations

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site user or higher roles.    

### Example
    
    C:\PS>Get-IqpInvitation -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="send-invitation">Send-IqpInvitation</a>

### Description

Sends a new invitation
    
### Syntax

    Send-IqpInvitation [-Connection < Hashtable >] [-SiteId] < String > [-Invitation] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Invitation < Object >

    Required parameter. A invitation with the following structure:
    
        - id: string
        - site_id: string
        - site_name: string
        - invitee_name: string
        - invitee_email: string
        - expire_time: Date

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
     C:\PS>Send-IqpInvitation -SiteId 1 -Invitation @{ site_id="1"; site_name="Test site"; invitee_email="test@somewhere.com" 

---

# <a name="delete-invitation">Remove-IqpInvitation</a>
    
### Description

Removes invitation by its unique id
    
### Syntax

    Remove-IqpInvitation [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Id < String >

    A invitation id. Required parameter. Can be retrieved from Get-IqpInvitations

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Remove-IqpInvitation -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2