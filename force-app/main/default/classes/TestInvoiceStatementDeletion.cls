@isTest
private class TestInvoiceStatementDeletion {

    static testmethod void TestDeleteInvoiceWithLineItem(){
        //create an invoice statement with line item then try to delete it
        Invoice_Statement__c inv= TestDataFactory.createOneInvoiceStatement(true);
        Test.startTest();
        Database.DeleteResult result = Database.delete(inv,false);
        Test.stopTest();
        //verify invoice with a line item didn´t get deleted
        System.assert(!result.isSuccess());
    }
    
    static testmethod void TestDeleteInvoiceWithoutLineItems(){
        //create an invoice statement without a line item and try to delete it
        Invoice_Statement__c inv = TestDataFactory.createOneInvoiceStatement(false);
        Test.startTest();
        Database.DeleteResult result = Database.delete(inv,false);
        Test.stopTest();
        
        //verify invoice without line items got deleted
        System.assert(result.isSuccess());
    }
    
    static testmethod void TestBulkDeleteInvoice(){
        List<Invoice_Statement__c> invList = new List<Invoice_Statement__c>();
        invList.add(TestDataFactory.createOneInvoiceStatement(true));
        invList.add(TestDataFactory.createOneInvoiceStatement(false));
        
        Test.startTest();
        Database.DeleteResult[]  results = Database.delete(invList, false);
        Test.stopTest();
        
        System.assert(!results[0].isSuccess());
        System.assert(results[1].isSuccess());
    }
}