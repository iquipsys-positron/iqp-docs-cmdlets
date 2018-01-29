Page navigation

* [Get statistics groups](#stat-groups)
* [Get statistics counters](#stat-counters)
* [Read statistics counter values](#read-statistics)
* [Increase statistics counter value](#add-statistics)

---

# <a name="stat-groups">Get-IqsStatGroups</a>
   
### Description

Get groups from statistics
    
### Syntax

    Get-IqsStatGroups [-Connection < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object
        
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
    
    C:\PS>Get-IqsStatGroups

---

# <a name="stat-counters">Get-IqsStatCounters</a>
   
### Description

Gets a page of counters from statistics that satisfy specified criteria
    
### Syntax

    Get-IqsStatCounters [-Connection < Hashtable >] [[-Filter] < Hashtable >] [[-Skip] < Int32 >] [[-Take] < Int32 >] [< CommonParameters >]
    
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
    
    C:\PS>Get-IqsStatCounters

---

# <a name="read-statistics">Read-IqsStatCounter</a>
   
### Description

Gets value set for a counter or group of counterts at specified time horizon from/to time range
    
### Syntax

    Read-IqsStatCounter [-Connection < Hashtable >] [-Group] < String > [[-Counter] < String >] [[-Type] < Int32 >] [[-From] < Object >] [[-To] < Object >] [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object

-Group < String >

    A counter group
        
-Counter < String >

    A counter name
        
-Type < Int32 >

    A counter type - (0: Total, 1: Year, 2: Month, 3: Day, 4: Hour) (default: Total)
        
-From < Object >

    A start of the time range
        
-To < Object >

    An end of the time range
     
- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed system administrator role.

### Example
    
    C:\PS>Read-IqsStatCounter -Group 9cfaf79bc95b4a9e912314eb3db7a4ba -Counter params.all.distance -Type "Hour" -From ([DateTime]::UtcNow.AddDays(-7)) -To ([DateTime]::UtcNow)

---

# <a name="add-statistics">Add-IqsStatCounter</a>
   
### Description

Increments statistics counter by value, updates totals at all different time horizons
    
### Syntax

    Read-IqsStatCounter [-Connection < Hashtable >] [-Group] < String > [[-Counter] < String >] [[-Time] < DateTime >] [[-Timezone] < String >] [[-Value] < Int64 >] [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object

-Group < String >

    A counter group
        
-Counter < String >

    A counter name
  
-Time <DateTime>

    An increment time (Default: current time)
        
-Timezone <String>

    A timezone to calculate stats (Default: UTC)
        
-Value <Int64>
        
    An increment value (Default: 1)

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

To execute this cmdlet needed system administrator role.

### Example
    
    C:\PS>Add-IqsStatCounter -Group 9cfaf79bc95b4a9e912314eb3db7a4ba -Counter params.all.distance -Value 123