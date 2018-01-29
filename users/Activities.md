Page navigation

* [Read acitivities](#read-acitivities)
* [Write acitivity](#write-acitivity)

---

# <a name="read-acitivities">Read-IqsActivities</a>
   
### Description

Gets a page of user activities that satisfy specified criteria
    
### Syntax

    Read-IqsActivities [-Connection < Hashtable >] [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
- Filter < Hashtable >

    A filter with search criteria (default: no filter)
        
- Skip < Int32 >

    A number of records to skip (default: 0)
        
- Take < Int32 >

    A number of records to return (default: 100)
        
- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed system administrator role.

### Example
    
    C:\PS>Get-IqsActivities -Filter @{ type="signin" }

---

# <a name="write-acitivit">Write-IqsActivity</a>
   
### Description

 Writes a single user activity
    
### Syntax

    Write-IqsActivity [-Connection < Hashtable >] [[-Activity] < Object > [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object

- Activity <Object>
    An event to be written:
        - id: string
        - time: Date
        - type: string
        - party: ReferenceV1
            id: string
            type: string
            name: string
        - ref_item: ReferenceV1
            id: string
            type: string
            name: string
        - ref_parents: ReferenceV1[]
            id: string
            type: string
            name: string
        - ref_party: ReferenceV1
            id: string
            type: string
            name: string
        - details: any

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed system administrator role.

### Example
    
    C:\PS>Write-IqsActivity -Activity @{ type="signin"; time=@(Get-Date); party=@{ id="1"; name="Test user" } }