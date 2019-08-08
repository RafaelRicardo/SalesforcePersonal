@isTest(SeeAllData=true)
global class AccountProcessorTest{
	@isTest
    global static void method1(){
        Test.setMock(HttpCalloutMock.class, new AccountProcesor_Mock());
        Test.startTest();
        List<Account> lstAccount = [SELECT id FROM Account where id IN (SELECT AccountId from Contact)];
        List<id> lstIdCuenta = new List<id>();
        for(Account cuenta: lstAccount){
            lstIdCuenta.add(cuenta.id);
        }
        AccountProcessor.countContacts(lstIdCuenta);
        Test.stopTest();
        // runs callout and check results
     
    }
    
    global class AccountProcesor_Mock implements HttpCalloutMock {
	    global HttpResponse respond(HttpRequest req) {
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"status":"success"}');
        res.setStatusCode(200);
        return res; 
    }
}
}