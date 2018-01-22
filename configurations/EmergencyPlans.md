Page navigation

* [Get worksite emergency plans](#EmergencyPlans)
* [Get emergency plan info](#EmergencyPlan)
* [Create emergency plan](#new-EmergencyPlan)
* [Update emergency plan](#edit-EmergencyPlan)
* [Delete emergency plan](#delete-EmergencyPlan)

---

# <a name="EmergencyPlans">Get-IqpEmergencyPlans</a>
   
### Description

Gets a page with emergency plans that satisfy specified criteria
    
### Syntax


    Get-IqpEmergencyPlans [-Connection < Hashtable >] [-SiteId] < String > [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [[-Total] < Boolean >] [< CommonParameters >]
    
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
    
    C:\PS>Get-IqpEmergencyPlans -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Take 10

---

# <a name="EmergencyPlan">Get-IqpEmergencyPlan</a>

### Description

Gets emergency plan by its unique id
    
### Syntax

    Get-IqpEmergencyPlan [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Id < String >

    An emergency plan id. Required parameter. Can be retrieved from Get-IqpEmergencyPlans

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 
To execute this cmdlet needed site user or higher roles.    

### Example
    
    C:\PS>Get-IqpEmergencyPlan -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2

---

# <a name="new-EmergencyPlan">New-IqpEmergencyPlan</a>

### Description

Creates a new emergency plan.
    
### Syntax

    New-IqpEmergencyPlan [-Connection < Hashtable >] [-SiteId] < String > [-Plan] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Plan < Object >

    Required parameter. A object with the following structure:

        - id: string
        - site_id: string
        - name: string
        - steps: EmergencyStepV1[]
          - index: number
          - name: string
          - actions: EmergencyActionV1[]
            type: string
            params: any

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>New-IqpEmergencyPlan -SiteId 1 -Plan @{ site_id="1"; name="Aliens invasion"; steps=@( @{ index=0; name="Start praying alien god" } ) }

---

# <a name="edit-EmergencyPlan">Update-IqpEmergencyPlan</a>
 
### Description

Updates an existing emergency plan
    
### Syntax

    Update-IqpEmergencyPlan [-Connection < Hashtable >] [-SiteId] < String > [-Plan] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Plan < Object >

    Required parameter. A object with the following structure:

        - id: string
        - site_id: string
        - name: string
        - steps: EmergencyStepV1[]
          - index: number
          - name: string
          - actions: EmergencyActionV1[]
            type: string
            params: any


- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 
To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Update-IqpEmergencyPlan -SiteId 1 -Plan @{ site_id="1"; name="Aliens invasion"; steps=@( @{ index=0; name="Start praying alien god" } ) }
---

# <a name="delete-EmergencyPlan">Remove-IqpEmergencyPlan</a>
    
### Description

Removes emergency plan by id
    
### Syntax

    Remove-IqpEmergencyPlan [-Connection < Hashtable >] [-SiteId] < String > [-Id] < String > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- SiteId < String >

    A site id. Required parameter. Can be retrieved from Get-IqpSites
        
- Id < String >

    An emergency plan id. Required parameter. Can be retrieved from Get-IqpEmergencyPlans

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 
To execute this cmdlet needed site manager or higher roles.

### Example
    
    C:\PS>Remove-IqpEmergencyPlan -SiteId 9cfaf79bc95b4a9e912314eb3db7a4ba -Id 85e52f3abf2e4091b489dc4f01df2df2