@isTest
private class TestMyHelloWorld {

    static testmethod void validateHelloWorld(){
      Book__c b1 = new Book__c(Name = 'Libro 1',Price__c = 10);  
      Book__c b2 = new Book__c(Name = 'Libro 2',Price__c = 20);
        System.debug('precio: '+ b2.Price__c);
        
        Test.startTest();
        Database.SaveResult[] resul = Database.insert(new Book__c[]{b1,b2}, false);         
	    // insert b1;
        // insert b2;
        Test.stopTest();
        List<Book__c> lista = new List<Book__c>();
        lista.add(b1);
        lista.add(b2);
        MyHelloWorld.applyDiscount(lista);
        
        System.debug('precio after : ');
       // System.assertEquals(90, b.Price__c);
    }
    
}