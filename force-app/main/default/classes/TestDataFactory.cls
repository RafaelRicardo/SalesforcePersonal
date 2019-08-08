@isTest
public class TestDataFactory {    
    public static List<Account> createAccountsWithOpps(Integer numAccts, Integer numOppsPerAcct) {

        List<Account> accts = new List<Account>();
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts;

        List<Opportunity> opps = new List<Opportunity>();
        for (Integer j=0;j<numAccts;j++) {
            Account acct = accts[j];

            // For each account just inserted, add opportunities
            for (Integer k=0;k<numOppsPerAcct;k++) {
                opps.add(new Opportunity(Name=acct.Name + ' Opportunity ' + k,
                                       StageName='Prospecting',
                                       CloseDate=System.today().addMonths(1),
                                       AccountId=acct.Id));
            }
        }
        // Insert all opportunities for all accounts.
        insert opps;
        return accts;
    }

   public static Invoice_Statement__c createOneInvoiceStatement(Boolean withLineItem){
   //create invoice statement
   Invoice_Statement__c testInvoice =  createInvoiceStatement();
       if(withLineItem == true){
           //create Merchandise item
           Merchandise__c objetoMer = createdMerchandiseItem('orange item');
           //create one line item and associate it with the invoice statement
           AddLineItem(testInvoice, objetoMer);
       }
       return testInvoice;
   }
    
    private static Merchandise__c createdMerchandiseItem(String MerchanName){
        Merchandise__c objetoMer = new Merchandise__c(
        Name=MerchanName,
        Description__c='fresh juice',
        Price__c=2,
        Total_Inventory__c=1000);
        insert objetoMer;
        return objetoMer;
    }
    
    private static Invoice_Statement__c createInvoiceStatement(){
        Invoice_Statement__c inv = new Invoice_Statement__c(
        Description__c='Test invoice');
        insert inv;
        return inv;
    }
    
    private static Line_Item__c AddLineItem(Invoice_Statement__c inv,
                                           Merchandise__c mer){
        Line_Item__c lineItem = new Line_Item__c(
        Invoice_Statement__c = inv.Id,
        Merchandise__c=mer.Id,
        Unit_Price__c=mer.Price__c,
        Units_Sold__c=(Double)(10*Math.random()+1));
        insert lineItem;
        return lineItem;                                       
    }
}