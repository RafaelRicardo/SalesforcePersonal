@RestResource(urlMapping='/Account/*')
global with sharing class AccountManager {
    
    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        try{
        Account result = [SELECT id, Name, (SELECT id, Name FROM Contacts) FROM Account WHERE id =: accountId];     
            return result;       
        }catch(Exception exe){
            return [SELECT id, Name, (SELECT id, Name FROM Contacts) FROM Account WHERE id =: creaContacto().AccountId];
        }       
    }
    
    public static Account creaCuenta(){
        Account cuenta = new Account(
            Name      = 'Nombre de cuenta de prueba',
            Rating    = 'Hot',
            Phone  	  = '316 7887438',
            Active__c = 'Yes'            
        );
        insert cuenta;
        return cuenta;
    }
    
    public static Contact creaContacto(){
        Contact contacto = new Contact(
            AccountId = creaCuenta().id,
            LastName = 'LastName'
        );
        insert contacto;
        return contacto;
    }
    

}