public class MerchandiseOperations {

    public static Id invoice(String pName, Integer pSold, String pDesc){
    //retrieve the pencils sample merchandise
    Merchandise__c objetoMerchandise = [SELECT Price__c, Total_Inventory__c
                       FROM Merchandise__c WHERE Name=: pName LIMIT 1];
                       
    //break if no merchandise is found
    System.assertNotEquals(null,objetoMerchandise); 
    
    //add a new invoice
    Invoice_Statement__c objetoInvoice = new Invoice_Statement__c(
                         Description__c = pDesc);
    insert objetoInvoice;
        
        //add a new line item to the invoice
    Line_Item__c objetoLine = new Line_Item__c(
            Name='1',
            Invoice_Statement__c = objetoInvoice.Id,
            Merchandise__c = objetoMerchandise.Id,
            Unit_Price__c = objetoMerchandise.Price__c,
            Units_Sold__c = pSold);
    insert objetoLine;
        
        //update the inventory of the Merchandise item
    objetoMerchandise.Total_Inventory__c -= pSold;
    update objetoMerchandise;
    
    return objetoInvoice.Id;
    }
}