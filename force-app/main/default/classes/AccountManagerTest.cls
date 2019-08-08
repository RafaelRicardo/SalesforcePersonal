@isTest
public class AccountManagerTest {

    @isTest static void testGetAccounteById(){
   		String idAccount = AccountManagerTest.creaCuenta();
        RestRequest request = new RestRequest();
        request.requestUri = 'https://na34.salesforce.com/services/apexrest/Account/' + idAccount;
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account cuenta = AccountManager.getAccount();
    }
    
    @isTest static void testGetAccountByError(){
        RestRequest request = new RestRequest();
        request.requestUri = 'https://na34.salesforce.com/services/apexrest/Account/' + '00161000007Sbez';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account cuenta   = AccountManager.getAccount();
        Contact contacto = AccountManager.creaContacto();
        
    }
    
    static id creaCuenta(){
        Account cuenta = new Account(
            Name      = 'Nombre de cuenta de prueba',
            Rating    = 'Hot',
            Phone  	  = '316 7887438',
            Active__c = 'Yes'
        );
        insert cuenta;
		return cuenta.id;        
    }
}