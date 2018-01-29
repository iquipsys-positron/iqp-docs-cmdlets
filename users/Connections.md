Page navigation

* [Connect facade](#connect-facade)
* [Disconnect facade](#disconnect-facade)

---

# <a name="connect-facade">Connect-IqsFacade</a>
   
### Description

Open-IqsConnection opens a new connection with client facade
    
### Syntax

    Connect-IqsFacade [[-Name] < String >] [[-Protocol] < String >] [-Host] < String > [[-Port] <Int32>] [-Login] < String > [-Password] < String > [< CommonParameters >]
    
### Parameters

- Name < String >

    A name to refer to the client facade
        
- Protocol < String >

    A facade connection protocol (default: http)
        
- Host < String >

    A facade host to access the cluster
        
- Port <Int32>
    
    A facade port to access the cluster (default: 80)
        
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

Anybody can execute this cmdlet

### Example
    
    C:\PS>$test = Connect-IqsFacade -Host "172.16.141.175" -Post 28800 -Login "test1@somewhere.com" -Password "password123"

---

# <a name="disconnect-facade">Disconnect-IqsFacade</a>
   
### Description

Disconnect-IqsFacade closes previously opened user session and disconnects client facade
    
### Syntax

    Disconnect-IqsFacade [[-Connection] < Hashtable >] [[-Name] < String >] [< CommonParameters >]
    
### Parameters

- Connection < Hashtable >

	A connection object

- Name < String >

    A name to refer to the client facade

- < CommonParameters >

    This commandlet supports common parameters: Verbose, Debug,
    ErrorAction, ErrorVariable, WarningAction, WarningVariable,
    OutBuffer, PipelineVariable и OutVariable. View more in article 
    about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
### Access security 

Any signed user can execute this cmdlet

### Example
    
    C:\PS>Disconnect-IqsFacade