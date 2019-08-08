public class SOQL_SOSL {
    
    public void buscaDatosMerchandise_SOQL(){
        
        sObject resultado = [SELECT Id, Name, Price__c, Total_Inventory__c 
                             FROM Merchandise__c WHERE Name = 'Notebooks'];
        System.debug('Resultado '+ resultado.Id);
    }
    
    public void buscaDatosMerchandise_TotalInventory_SOQL(){
        Double total = [SELECT Total_Inventory__c FROM Merchandise__c
                       WHERE Name = 'Pencils'][0].Total_Inventory__c;
        System.debug('Total: '+ total);
    }
    
    public void buscaDatosMerchandise_SOSL(){
        List<List<sObject>> searchLista = [FIND 'Pencil*' IN ALL FIELDS RETURNING
                                          Merchandise__c (Id, Name), Invoice_Statement__c];
     Merchandise__c[] merList = ((List<Merchandise__c>)searchLista[0]);
     Invoice_Statement__c[] invList = ((List<Invoice_Statement__c>)searchLista[1]);
        System.debug('1: '+merList.get(0).Id);
        System.debug('2: '+invList.size());
    }

    public void buscaDatosLineItem_SOSL(){
        Line_Item__c objetolineItem = [SELECT Invoice_Statement__r.Name 
                                       FROM Line_Item__c limit 1];
        System.debug('Line item: '+objetolineItem.Invoice_Statement__r.Name);
    }
    
    public void buscaDatosInvoice(){
        Invoice_Statement__c dato = [SELECT Id, Name, 
                                     (SELECT Units_Sold__c FROM Line_Items__r)
                                      FROM Invoice_Statement__c
                                      WHERE Name = 'INV-0000'];
        List<Line_Item__c> lista = dato.Line_Items__r;
        System.debug('Line_items__r1: '+lista.size());
        System.debug('Line_items__r2: '+lista.get(0).Units_Sold__c);
    }
}